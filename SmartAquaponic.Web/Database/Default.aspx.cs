// --------------------------------------------------------------------
// <copyright file="Default.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Database
{
    using System;
    using System.IO;
    using System.Linq;
    using System.Web;
    using System.Web.ApplicationServices;
    using System.Web.UI.WebControls;
    using SmartAquaponic.Business;
    using SmartAquaponic.Common.Enum;
    using SmartAquaponic.Common.Execptions;
    using SmartAquaponic.Common.Extensions;
    using SmartAquaponic.Common.Helpers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Web.Base;
    using SmartAquaponic.Web.Controls;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// Default.
    /// </summary>
    public partial class Default : CustomPage
    {
        /// <inheritdoc/>
        internal override void SetControls()
        {
            //this.BtnCreate.NavigateUrl = Constants.Pages.CreateUser;
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
            if (this.IsUserLogged())
            {
                this.SetControls();
                this.LoadRestore();

                this.BtnBackup.Visible = this.IsUserAuthorized(Constants.Permission.Backup, false);
                this.BtnRestore.Visible = this.IsUserAuthorized(Constants.Permission.Restore, false);
                this.BtnVerify.Visible = this.IsUserAuthorized(Constants.Permission.DbIntegrity, false);
            }
        }

        private void LoadRestore()
        {
            this.DdlFiles.Items.Clear();

            var files = new DirectoryInfo(Server.MapPath(".")).GetFiles("*.sabak").OrderBy(x => x.CreationTime);
            foreach (var file in files)
            {
                DdlFiles.Items.Add(new ListItem(file.Name.Replace(".sabak", string.Empty), file.FullName));
            }

            DdlFiles.SelectedIndex = 0;
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

        private string GetFileName()
        {
            return $"{Server.MapPath(".")}\\{TxtName.Text}-{DateTime.Now.ToShortDateTime2()}";
        }

        private bool IsEntityValid()
        {
            var result = true;

            if (string.IsNullOrEmpty(this.TxtName.Text) || this.TxtName.Text.Length > 50)
            {
                this.TxtName.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtName.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            return result;
        }

        protected void BtnBackup_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.IsEntityValid())
                {
                    if (new ChecksumBll(this.GetUser(), this.GetIp()).ValidateIntegrity())
                    {
                        var result = new DbBll(this.GetUser(), this.GetIp()).Backup(this.GetFileName(), Convert.ToInt32(DdlVolumes.SelectedValue));

                        if (result > 0)
                        {
                            this.ShowError(this.GetResource(result.ToString()), alertType: BootstrapContextualType.Info);
                            this.TxtName.Text = string.Empty;
                            this.LoadRestore();
                        }
                        else
                        {
                            this.ShowError(this.GetResource(result.ToString()));
                        }
                    }
                }
            }
            catch (IntegrityException ex)
            {
                this.ShowError($"{this.GetResource(ex.ErrorCode)}");
            }
            catch (Exception ex)
            {
                this.ShowError(this.GetResource(Constants.Errors.UnexpectedError), hideMainPanel: true);
                this.LogMessage(ex);
            }
        }

        protected void BtnRestore_Click(object sender, EventArgs e)
        {
            try
            {
                var result = new DbBll(this.GetUser(), this.GetIp()).Restore(this.DdlFiles.SelectedValue);

                if (result > 0)
                {
                    this.ShowError(this.GetResource(result.ToString()), alertType: BootstrapContextualType.Info);
                    this.Session.Clear();

                    this.BtnBackup.Visible = false;
                    this.BtnRestore.Visible = false;
                    this.BtnVerify.Visible = false;
                    this.BtnRecovery.Visible = false;
                }
                else
                {
                    this.ShowError(this.GetResource(result.ToString()));
                }
            }
            catch (Exception ex)
            {
                this.ShowError(this.GetResource(Constants.Errors.UnexpectedError), hideMainPanel: true);
                this.LogMessage(ex);
            }
        }

        protected void BtnVerify_Click(object sender, EventArgs e)
        {
            try
            {
                new ChecksumBll(this.GetUser(), this.GetIp()).ValidateIntegrity();

                this.ShowError(this.GetResource(Constants.Successes.IntegritySuccess), alertType: BootstrapContextualType.Info);
            }
            catch (IntegrityException ex)
            {
                this.ShowError($"{this.GetResource(ex.ErrorCode)} <br /> {ex.Message}");
                this.BtnRecovery.Visible = this.IsUserAuthorized(Constants.Permission.DbResetIntegrity, false);
                this.BtnRestore.Enabled = false;
                this.BtnVerify.Enabled = false;
            }
            catch (Exception ex)
            {
                this.ShowError(this.GetResource(Constants.Errors.UnexpectedError), hideMainPanel: true);
                this.LogMessage(ex);
            }
        }

        protected void BtnRecovery_Click(object sender, EventArgs e)
        {
            try
            {
                new ChecksumBll(this.GetUser(), this.GetIp()).ResetIntegrity();

                this.BtnRecovery.Enabled = false;

                this.ShowError(this.GetResource(Constants.Successes.IntegritySuccess), alertType: BootstrapContextualType.Info);
            }
            catch (Exception ex)
            {
                this.ShowError(this.GetResource(Constants.Errors.UnexpectedError), hideMainPanel: true);
                this.LogMessage(ex);
            }
        }
    }
}