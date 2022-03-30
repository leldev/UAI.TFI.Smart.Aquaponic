// --------------------------------------------------------------------
// <copyright file="Login.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Contact
{
    using System;
    using SmartAquaponic.Business;
    using SmartAquaponic.Common.Enum;
    using SmartAquaponic.Common.Extensions;
    using SmartAquaponic.Common.Execptions;
    using SmartAquaponic.Common.Helpers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Web.Base;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// Login.
    /// </summary>
    public partial class Update : CustomPage
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
        /// BtnSend_Click.
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        protected void BtnSend_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.IsEntityValid())
                {
                    var result = new CommunicationBll(this.GetUser(), this.GetIp())
                        .Update(new Communication()
                        {
                            Id = Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]),
                            ModifiedDate = Convert.ToDateTime(this.FldModifiedDate.Value),
                            Response = this.TxtResponse.Text,
                            Email = this.FldEmail.Value,
                        });

                    if (result > 0)
                    {
                        this.Response.Redirect(Constants.Pages.ContactUs, false);
                    }
                    else
                    {
                        this.ShowError(this.GetResource(result.ToString()));
                    }
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
                this.IsUserAuthorized(Constants.Permission.Communication);
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
                var item = new CommunicationBll().Read(id);

                if (item == null)
                {
                    this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
                }
                else
                {
                    this.LblEmailValue.Text = item.Email;
                    this.LblMessageValue.Text = item.Message;
                    this.LblNameValue.Text = item.Name;
                    this.FldModifiedDate.Value = item.ModifiedDate.ToDateTime2();
                    this.FldEmail.Value = item.Email;

                    this.BtnSend.Visible = !item.IsAnswered;
                }
            }
        }

        private bool IsEntityValid()
        {
            var result = true;

            if (string.IsNullOrEmpty(this.TxtResponse.Text))
            {
                this.TxtResponse.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtResponse.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            return result;
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