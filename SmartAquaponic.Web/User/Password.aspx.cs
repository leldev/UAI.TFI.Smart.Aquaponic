// --------------------------------------------------------------------
// <copyright file="Password.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.User
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.UI.WebControls;
    using SmartAquaponic.Business;
    using SmartAquaponic.Common.Enum;
    using SmartAquaponic.Common.Extensions;
    using SmartAquaponic.Common.Helpers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Web.Base;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// Update.
    /// </summary>
    public partial class Password : CustomPage
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

        private void Build()
        {
            this.SetControls();
            this.LoadData();
        }

        private void LoadData()
        {
            if (this.Request.QueryString[Constants.QueryStrings.Id] == null)
            {
                PnlRecoveryByEmail.Visible = true;
            }
            else
            {
                if (this.IsUserLogged())
                {
                    this.IsUserAuthorized(Constants.Permission.GeneratePassword);

                    PnlRecoveryByUserId.Visible = true;

                    var id = Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]);

                    if (id == 0)
                    {
                        this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
                    }
                    else
                    {
                        var user = new UserBll(this.GetUser(), this.GetIp()).Read(id);

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
                        }
                    }
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

        protected void BtnGeneratePassword_Click(object sender, EventArgs e)
        {
            try
            {
                var hasId = this.Request.QueryString[Constants.QueryStrings.Id] != null;
                var result = new UserBll(this.GetUser(), this.GetIp())
                    .RecoveryPassword(new User()
                {
                    Id = hasId ? Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]) : 0,
                    Email = hasId ? LblEmailValue.Text : TxtEmail.Text,
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
    }
}