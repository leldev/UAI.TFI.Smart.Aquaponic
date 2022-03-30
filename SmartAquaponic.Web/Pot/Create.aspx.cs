// --------------------------------------------------------------------
// <copyright file="Create.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Pot
{
    using System;
    using System.Collections.Generic;
    using System.Web.UI.WebControls;
    using SmartAquaponic.Business;
    using SmartAquaponic.Common.Enum;
    using SmartAquaponic.Common.Helpers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Domain.Enum;
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
                    var result = new PotBll(this.GetUser(), this.GetIp()).Create(
                        new Pot()
                        {
                            Name = this.TxtName.Text,
                            Heigth = Convert.ToDecimal(this.TxtHeigth.Text),
                            Length = Convert.ToDecimal(this.TxtLength.Text),
                            Width = Convert.ToDecimal(this.TxtWidth.Text),
                            Plants = this.GetPlants(),
                            Rgb = this.TxtRgb.Text,
                            Rock = (RockType)Convert.ToInt32(this.DdlRock.SelectedValue)
                        });

                    if (result > 0)
                    {
                        this.Response.Redirect(Constants.Pages.Pot, false);
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
                this.IsUserAuthorized(Constants.Permission.PotManagement);
                this.SetControls();
                this.LoadData();
            }
        }

        private void LoadData()
        {
            var result = new PlantBll().Read();

            foreach (var item in result)
            {
                DdlPlants.Items.Add(new ListItem(item.Name, item.Id.ToString()));
            }

            foreach (RockType type in Enum.GetValues(typeof(RockType)))
            {
                DdlRock.Items.Add(new ListItem(this.GetResource(type.ToString()), ((int)type).ToString()));
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

            if (string.IsNullOrEmpty(this.TxtHeigth.Text))
            {
                this.TxtHeigth.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtHeigth.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            if (string.IsNullOrEmpty(this.TxtLength.Text))
            {
                this.TxtLength.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtLength.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            if (string.IsNullOrEmpty(this.TxtRgb.Text) || this.TxtRgb.Text.Length > 7)
            {
                this.TxtRgb.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtRgb.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            if (string.IsNullOrEmpty(this.TxtWidth.Text))
            {
                this.TxtWidth.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtWidth.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            return result;
        }

        private IList<Plant> GetPlants()
        {
            var result = new List<Plant>();

            foreach (ListItem item in DdlPlants.Items)
            {
                if (item.Selected)
                {
                    result.Add(new Plant()
                    {
                        Id = Convert.ToInt32(item.Value),
                        Name = item.Text,
                    });
                }
            }

            return result;
        }
    }
}