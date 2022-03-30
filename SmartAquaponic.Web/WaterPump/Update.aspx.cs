// --------------------------------------------------------------------
// <copyright file="Update.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.WaterPump
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
        /// BtnSave_Click.
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.IsEntityValid())
                {
                    var result = new WaterPumpBll(this.GetUser(), this.GetIp())
                        .Update(
                        new WaterPump()
                        {
                            Id = Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]),
                            ModifiedDate = Convert.ToDateTime(this.FldModifiedDate.Value),
                            Name = this.TxtName.Text,
                            Power = Convert.ToInt32(this.TxtPower.Text),
                            FlowRate = Convert.ToInt32(this.TxtFlowRate.Text),
                            Volume = Convert.ToDecimal(this.TxtVolume.Text),
                        });

                    if (result > 0)
                    {
                        this.Response.Redirect(Constants.Pages.WaterPump, false);
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
                this.IsUserAuthorized(Constants.Permission.WaterPumpManagement);
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
                var waterPump = new WaterPumpBll().Read(id);

                if (waterPump == null)
                {
                    this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
                }
                else
                {
                    this.TxtName.Text = waterPump.Name;
                    this.TxtFlowRate.Text = waterPump.FlowRate.ToString();
                    this.TxtPower.Text = waterPump.Power.ToString();
                    this.TxtVolume.Text = waterPump.Volume.ToString();
                    this.FldModifiedDate.Value = waterPump.ModifiedDate.ToDateTime2();
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

            if (string.IsNullOrEmpty(this.TxtFlowRate.Text))
            {
                this.TxtFlowRate.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtFlowRate.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            if (string.IsNullOrEmpty(this.TxtPower.Text))
            {
                this.TxtPower.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtPower.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            if (string.IsNullOrEmpty(this.TxtVolume.Text))
            {
                this.TxtVolume.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtVolume.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            return result;
        }
    }
}