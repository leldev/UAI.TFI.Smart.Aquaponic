// --------------------------------------------------------------------
// <copyright file="Delete.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Pot
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
    public partial class Delete : CustomPage
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
        /// BtnDelete_Click.
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                var result = new PotBll(this.GetUser(), this.GetIp()).Delete(
                    new Pot()
                    {
                        Id = Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]),
                    });

                if (result > 0)
                {
                    this.Response.Redirect(Constants.Pages.Pot, false);
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
                this.IsUserAuthorized(Constants.Permission.PotManagement);
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
                var pot = new PotBll().Read(id);

                if (pot == null)
                {
                    this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
                }
                else
                {
                    this.LblNameValue.Text = pot.Name;
                    this.LblHeigthValue.Text = pot.Heigth.ToString();
                    this.LblWidthValue.Text = pot.Width.ToString();
                    this.LblLengthValue.Text = pot.Length.ToString();
                    this.LblRgbValue.Text = pot.Rgb;
                    this.CrcRgb.Checked = true;
                    this.CrcRgb.FullCircle = true;
                    this.CrcRgb.Rgb = pot.Rgb;
                    this.LblRockValue.Text = this.GetResource(pot.Rock.ToString());
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
