// --------------------------------------------------------------------
// <copyright file="Update.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Product
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.UI.WebControls;
    using Newtonsoft.Json;
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
                    var result = new ProductBll(this.GetUser(), this.GetIp())
                        .Update(
                        new Product()
                        {
                            Id = Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]),
                            ModifiedDate = Convert.ToDateTime(this.FldModifiedDate.Value),
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
            var id = Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]);

            if (id == 0)
            {
                this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
            }
            else
            {
                var product = new ProductBll().Read(id);

                if (product == null)
                {
                    this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
                }
                else
                {
                    this.TxtName.Text = product.Name;
                    this.FldModifiedDate.Value = product.ModifiedDate.ToDateTime2();

                    var tanks = new TankBll().Read();
                    var pots = new PotBll().Read();
                    var spotLights = new SpotLightBll().Read();

                    this.FldTank.Value = JsonConvert.SerializeObject(tanks);
                    this.FldPot.Value = JsonConvert.SerializeObject(pots);
                    this.FldSpotLight.Value = JsonConvert.SerializeObject(spotLights);

                    // load tanks
                    this.DdlTank.Items.Add(new ListItem(string.Empty, string.Empty));

                    foreach (var item in tanks)
                    {
                        var option = new ListItem($"{item.Name} - {item.Length} x {item.Heigth} x {item.Width}", item.Id.ToString());
                        option.Attributes.Add("title", $"{item.Name} - {item.Length} x {item.Heigth} x {item.Width}");

                        this.DdlTank.Items.Add(option);
                    }

                    // load pots
                    this.DdlPot.Items.Add(new ListItem(string.Empty, string.Empty));

                    foreach (var item in pots)
                    {
                        var option = new ListItem($"{item.Name} - {item.Length} x {item.Heigth} x {item.Width}", item.Id.ToString());
                        option.Attributes.Add("title", $"{item.Name} - {item.Length} x {item.Heigth} x {item.Width}");

                        this.DdlPot.Items.Add(option);
                    }

                    // load water pumps
                    this.DdlSpotLight.Items.Add(new ListItem(string.Empty, string.Empty));

                    foreach (var item in spotLights)
                    {
                        var option = new ListItem(item.Name, item.Id.ToString());

                        this.DdlSpotLight.Items.Add(option);
                    }

                    // set values
                    this.DdlPot.SelectedValue = product.Pot.Id.ToString();
                    this.DdlTank.SelectedValue = product.Tank.Id.ToString();
                    this.DdlSpotLight.SelectedValue = product.SpotLight?.Id.ToString();
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

            return result;
        }
    }
}