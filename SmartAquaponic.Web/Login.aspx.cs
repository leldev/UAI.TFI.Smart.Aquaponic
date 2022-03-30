// --------------------------------------------------------------------
// <copyright file="Login.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web
{
    using System;
    using SmartAquaponic.Business;
    using SmartAquaponic.Common.Enum;
    using SmartAquaponic.Common.Execptions;
    using SmartAquaponic.Common.Helpers;
    using SmartAquaponic.Web.Base;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// Login.
    /// </summary>
    public partial class Login : CustomPage
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
        /// BtnSignIn_Click.
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        protected void BtnSignIn_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.IsEntityValid())
                {
                    var user = new UserBll(this.GetUser(), this.GetIp())
                        .Login(this.TxtUsername.Text, this.TxtPassword.Text);

                    this.Session.Add(Constants.Sessions.UserLogged, user);

                    this.Response.Redirect(Constants.Pages.Default, false);
                }
            }
            catch (LoginException ex)
            {
                this.ShowError(this.GetResource(ex.ErrorCode));
            }
            catch (UserMustResetPasswordException ex)
            {
                this.Response.Redirect($"{Constants.Pages.PasswordReset}?id={ex.Message}", false);
            }
            catch (Exception ex)
            {
                this.ShowError(this.GetResource(Constants.Errors.UnexpectedError), hideMainPanel: true);
                this.LogMessage(ex);
            }
        }

        private void Build()
        {
            this.BtnRecoveryPassword.NavigateUrl = Constants.Pages.PasswordUser;
            this.SetControls();
        }

        private bool IsEntityValid()
        {
            var result = true;

            if (string.IsNullOrEmpty(this.TxtUsername.Text))
            {
                this.TxtUsername.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtUsername.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            if (string.IsNullOrEmpty(this.TxtPassword.Text))
            {
                this.TxtPassword.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtPassword.CssClass = BootstrapHerlper.GetValidFormClass();
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