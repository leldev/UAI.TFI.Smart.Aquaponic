// --------------------------------------------------------------------
// <copyright file="Delete.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Tank
{
    using System;
    using System.Linq;
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
                var result = new TankBll(this.GetUser(), this.GetIp()).Delete(
                    new Tank()
                    {
                        Id = Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]),
                    });

                if (result > 0)
                {
                    this.Response.Redirect(Constants.Pages.Tank, false);
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
                this.IsUserAuthorized(Constants.Permission.TankManagement);
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
                var tank = new TankBll().Read(id);

                if (tank == null)
                {
                    this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
                }
                else
                {
                    this.LblNameValue.Text = tank.Name;
                    this.LblHeigthValue.Text = tank.Heigth.ToString();
                    this.LblWidthValue.Text = tank.Width.ToString();
                    this.LblLengthValue.Text = tank.Length.ToString();
                    this.LblWaterPumpValue.Text = tank.WaterPump?.Name.ToString();
                    this.LblWaterTempValue.Text = tank.WaterTemp.ToString();
                    this.LblPhValue.Text = this.GetResource(tank.Ph.ToString());
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
