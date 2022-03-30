// --------------------------------------------------------------------
// <copyright file="Create.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Tank
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.UI.WebControls;
    using Newtonsoft.Json;
    using SmartAquaponic.Business;
    using SmartAquaponic.Common.Enum;
    using SmartAquaponic.Common.Execptions;
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
                    var result = new TankBll(this.GetUser(), this.GetIp()).Create(
                        new Tank()
                        {
                            Name = this.TxtName.Text,
                            Heigth = Convert.ToDecimal(this.TxtHeigth.Text),
                            Length = Convert.ToDecimal(this.TxtLength.Text),
                            Width = Convert.ToDecimal(this.TxtWidth.Text),
                            WaterTemp = Convert.ToDecimal(this.TxtWaterTemp.Text),
                            Ph = (PhType)Convert.ToInt32(this.DdlPh.SelectedValue),
                            WaterPump = this.GetSelectedWaterPump(),
                            Fishes = this.GetSelectedFishes(),
                            Decors = this.GetSelectedDecors(),
                        }); ;

                    if (result > 0)
                    {
                        this.Response.Redirect(Constants.Pages.Tank, false);
                    }
                    else
                    {
                        this.ShowError(this.GetResource(result.ToString()));
                    }
                }
            }
            catch (TankException ex)
            {
                this.ShowError(ex.Message);
            }
            catch (Exception ex)
            {
                this.ShowError(this.GetResource(Constants.Errors.UnexpectedError), hideMainPanel: true);
                this.LogMessage(ex);
            }
            finally
            {
                this.FixSelectedFish();
            }
        }

        private void FixSelectedFish()
        {
            try
            {
                foreach (RepeaterItem item in this.RptData.Items)
                {
                    var cbxFish = item.FindControl(Constants.Controls.CbxFish) as CheckBox;
                    var txtCant = item.FindControl(Constants.Controls.TxtCant) as TextBox;

                    txtCant.Enabled = cbxFish.Checked;
                }
            }
            catch { }
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
            var fishes = new FishBll().Read();
            var decors = new DecorBll().Read();
            var waterPumps = new WaterPumpBll().Read();

            this.FldFishes.Value = JsonConvert.SerializeObject(fishes);
            this.FldDecors.Value = JsonConvert.SerializeObject(decors);
            this.FldWaterPumps.Value = JsonConvert.SerializeObject(waterPumps);

            // load fishes
            this.RptData.ItemDataBound += this.RptData_ItemDataBound;
            this.RptData.DataSource = fishes;
            this.RptData.DataBind();

            // load decors
            foreach (var item in decors)
            {
                var option = new ListItem(item.Name, item.Id.ToString());
                option.Attributes.Add("title", $"{item.Name} {Constants.HtmlTag.Br} {item.Volume} cm3");
                option.Attributes.Add("data-toggle", "tooltip");
                option.Attributes.Add("data-html", "true");

                DdlDecors.Items.Add(option);
            }

            // load water pumps
            foreach (var item in waterPumps)
            {
                var option = new ListItem(item.Name, item.Id.ToString());
                option.Attributes.Add("title", $"{item.Name} - {item.Volume} cm3 - {item.FlowRate} l/h");

                DdlWaterPump.Items.Add(option);
            }

            // load ph
            foreach (PhType type in Enum.GetValues(typeof(PhType)))
            {
                DdlPh.Items.Add(new ListItem($"{((int)type).ToString()} - {this.GetResource(type.ToString())}", ((int)type).ToString()));
            }
        }

        private void RptData_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            this.SetResources(e.Item.Controls);

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var item = e.Item.DataItem as Fish;

                var cbxFish = e.Item.FindControl(Constants.Controls.CbxFish) as CheckBox;
                var flbId = e.Item.FindControl(Constants.Controls.FldId) as HiddenField;
                var txtCant = e.Item.FindControl(Constants.Controls.TxtCant) as TextBox;

                cbxFish.Checked = false;
                cbxFish.Text = item.Name;
                cbxFish.ToolTip = $"{item.Name} {Constants.HtmlTag.Br} {item.Size} cm {Constants.HtmlTag.Br} {item.WaterRequired} cm3 {Constants.HtmlTag.Br} {item.Temp} ºC {Constants.HtmlTag.Br} {(int)item.Ph} PH";

                flbId.Value = item.Id.ToString();
                txtCant.Enabled = false;
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

            if (string.IsNullOrEmpty(this.TxtWaterTemp.Text))
            {
                this.TxtWaterTemp.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtWaterTemp.CssClass = BootstrapHerlper.GetValidFormClass();
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

        private IList<Fish> GetSelectedFishes()
        {
            var result = new List<Fish>();
            var fishes = JsonConvert.DeserializeObject<List<Fish>>(this.FldFishes.Value);

            foreach (RepeaterItem item in this.RptData.Items)
            {
                var cbxFish = item.FindControl(Constants.Controls.CbxFish) as CheckBox;
                var flbId = item.FindControl(Constants.Controls.FldId) as HiddenField;
                var txtCant = item.FindControl(Constants.Controls.TxtCant) as TextBox;

                if (cbxFish.Checked)
                {
                    var cant = Convert.ToInt32(txtCant.Text);

                    for (int i = 0; i < cant; i++)
                    {
                        result.Add(fishes.FirstOrDefault(x => x.Id == Convert.ToInt32(flbId.Value)));
                    }
                }
            }

            return result;
        }

        private IList<Decor> GetSelectedDecors()
        {
            var result = new List<Decor>();
            var decors = JsonConvert.DeserializeObject<List<Decor>>(this.FldDecors.Value);

            foreach (ListItem item in DdlDecors.Items)
            {
                if (item.Selected)
                {
                    result.Add(decors.FirstOrDefault(x => x.Id == Convert.ToInt32(item.Value)));
                }
            }

            return result;
        }

        private WaterPump GetSelectedWaterPump()
        {
            var waterPumps = JsonConvert.DeserializeObject<List<WaterPump>>(this.FldWaterPumps.Value);

            return waterPumps.FirstOrDefault(x => x.Id == Convert.ToInt32(DdlWaterPump.SelectedValue));
        }
    }
}