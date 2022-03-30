// --------------------------------------------------------------------
// <copyright file="Unlock.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.User
{
    using System;
    using SmartAquaponic.Business;
    using SmartAquaponic.Common.Enum;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Web.Base;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// Delete.
    /// </summary>
    public partial class Recovery : CustomPage
    {
        /// <inheritdoc/>
        internal override void SetControls()
        {
            this.SetResources(this.Controls);
        }

        /// <summary>
        /// Page_Load.
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!this.IsPostBack)
                {
                    this.Build();
                }
            }
            catch (Exception ex)
            {
                this.ShowError(this.GetResource(Constants.Errors.UnexpectedError), hideMainPanel: true);
                this.LogMessage(ex);
            }
        }

        /// <summary>
        /// BtnUnlock_Click.
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        protected void BtnUnlock_Click(object sender, EventArgs e)
        {
            try
            {
                // TODO: because we are updating, we need all properties
                var result = new UserBll(this.GetUser(), this.GetIp()).Unlock(
                    new User()
                    {
                        Id = Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]),
                    });

                if (result > 0)
                {
                    this.Response.Redirect(Constants.Pages.User, false);
                }
                else
                {
                    this.ShowError(this.GetResource(result));
                }
            }
            catch (Exception ex)
            {
                this.ShowError(this.GetResource(Constants.Errors.UnexpectedError), hideMainPanel: true);
                this.LogMessage(ex);
            }
        }

        /// <summary>
        /// BtnRecovery_Click.
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        protected void BtnRecovery_Click(object sender, EventArgs e)
        {
            try
            {
                // TODO: because we are updating, we need all properties
                var result = new UserBll(this.GetUser(), this.GetIp()).Recovery(
                    new User()
                    {
                        Id = Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]),
                    });

                if (result > 0)
                {
                    this.Response.Redirect(Constants.Pages.User, false);
                }
                else
                {
                    this.ShowError(this.GetResource(result));
                }
            }
            catch (Exception ex)
            {
                this.ShowError(this.GetResource(Constants.Errors.UnexpectedError), hideMainPanel: true);
                this.LogMessage(ex);
            }
        }

        private void Build()
        {
            if (this.IsUserLogged())
            {
                this.IsUserAuthorized(Constants.Permission.RecoveryUser);
                this.SetControls();
                this.LoadData();
            }
        }

        private void LoadData()
        {
            var id = Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]);

            if (id == 0)
            {
                this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
            }
            else
            {
                var user = new UserBll().Read(id);

                if (user == null)
                {
                    this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
                }
                else
                {
                    this.LblNameValue.Text = user.Name;
                    this.LblLastNameValue.Text = user.LastName;
                    this.LblUsernameValue.Text = user.Username;
                    this.LblEmailValue.Text = user.Email;

                    this.BtnRecovery.Visible = user.IsDeleted;
                    this.BtnUnlock.Visible = user.IsLocked;
                }
            }
        }

        private void ShowError(string message, bool hideMainPanel = false, BootstrapContextualType alertType = BootstrapContextualType.Danger, bool isDismissible = true)
        {
            this.PnlMain.Visible = !hideMainPanel;

            this.AlertControl.Visible = true;
            this.AlertControl.Message = message;
            this.AlertControl.AlertType = alertType;
            this.AlertControl.IsAlertDismissible = isDismissible;
            this.AlertControl.PropertyBind();
        }
    }
}
