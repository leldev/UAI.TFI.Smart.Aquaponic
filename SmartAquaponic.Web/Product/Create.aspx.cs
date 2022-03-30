// --------------------------------------------------------------------
// <copyright file="Create.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Product
{
    using System;
    using System.Collections.Generic;
    using System.Web.UI.WebControls;
    using Newtonsoft.Json;
    using SmartAquaponic.Business;
    using SmartAquaponic.Common.Enum;
    using SmartAquaponic.Common.Helpers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Web.Base;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// Create.
    /// </summary>
    public partial class Create : CustomPage
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
        /// BtnCreate_Click.
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.IsEntityValid())
                {
                    var result = new ProductBll(this.GetUser(), this.GetIp()).Create(
                        new Product()
                        {
                            Name = this.TxtName.Text,
                            Pot = new Pot()
                            {
                                Id = Convert.ToInt32(this.DdlPot.SelectedValue),
                            },
                            SpotLight = string.IsNullOrEmpty(this.DdlSpotLight.SelectedValue) ? null : new SpotLight()
                            {
                                Id = Convert.ToInt32(this.DdlSpotLight.SelectedValue),
                            },
                            Tank = new Tank()
                            {
                                Id = Convert.ToInt32(this.DdlTank.SelectedValue),
                            },
                        });

                    if (result > 0)
                    {
                        this.Response.Redirect(Constants.Pages.Product, false);
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
                this.IsUserAuthorized(Constants.Permission.ProductManagement);
                this.SetControls();
                this.LoadData();
            }
        }

        private void LoadData()
        {
            var tanks = new TankBll().Read();
            var pots = new PotBll().Read();
            var spotLights = new SpotLightBll().Read();

            this.FldTank.Value = JsonConvert.SerializeObject(tanks);
            this.FldPot.Value = JsonConvert.SerializeObject(pots);
            this.FldSpotLight.Value = JsonConvert.SerializeObject(spotLights);

            // load tanks
            DdlTank.Items.Add(new ListItem(string.Empty, string.Empty));

            foreach (var item in tanks)
            {
                var option = new ListItem($"{item.Name} - {item.Length} x {item.Heigth} x {item.Width}", item.Id.ToString());
                option.Attributes.Add("title", $"{item.Name} - {item.Length} x {item.Heigth} x {item.Width}");

                DdlTank.Items.Add(option);
            }

            // load pots
            DdlPot.Items.Add(new ListItem(string.Empty, string.Empty));

            foreach (var item in pots)
            {
                var option = new ListItem($"{item.Name} - {item.Length} x {item.Heigth} x {item.Width}", item.Id.ToString());
                option.Attributes.Add("title", $"{item.Name} - {item.Length} x {item.Heigth} x {item.Width}");

                DdlPot.Items.Add(option);
            }

            // load water pumps
            DdlSpotLight.Items.Add(new ListItem(string.Empty, string.Empty));

            foreach (var item in spotLights)
            {
                var option = new ListItem(item.Name, item.Id.ToString());

                DdlSpotLight.Items.Add(option);
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

            return result;
        }
    }
}