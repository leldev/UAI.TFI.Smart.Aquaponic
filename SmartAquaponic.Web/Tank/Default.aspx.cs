// --------------------------------------------------------------------
// <copyright file="Default.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Tank
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.UI.WebControls;
    using SmartAquaponic.Business;
    using SmartAquaponic.Common.Enum;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Domain.Enum;
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
            this.BtnCreate.NavigateUrl = Constants.Pages.CreateTank;
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
                this.IsUserAuthorized(Constants.Permission.TankManagement);
                this.SetControls();
                this.LoadData();
            }
        }

        private void LoadData()
        {
            var result = new TankBll().Read();

            if (result.Count > 0)
            {
                this.RptData.ItemDataBound += this.RptData_ItemDataBound;
                this.RptData.DataSource = result;
                this.RptData.DataBind();
            }
            else
            {
                this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), alertType: BootstrapContextualType.Warning, isDismissible: false);
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

        private void RptData_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            this.SetResources(e.Item.Controls);

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var item = e.Item.DataItem as Tank;

                var lnkUpdate = e.Item.FindControl(Constants.Controls.LnkUpdate) as HyperLink;
                var lnkDelete = e.Item.FindControl(Constants.Controls.LnkDelete) as HyperLink;
                var lblPh = e.Item.FindControl(Constants.Controls.LblPh) as Label;
                var lblFishes = e.Item.FindControl(Constants.Controls.LblFishes) as Label;
                var lblDecors = e.Item.FindControl(Constants.Controls.LblDecors) as Label;
                var ltlWaterPump = e.Item.FindControl(Constants.Controls.LtlWaterPump) as Literal;
                var crcRgb = e.Item.FindControl(Constants.Controls.CrcRgb) as CircleControl;

                // dates
                var ltlCreateDate = e.Item.FindControl(Constants.Controls.LtlCreateDate) as Literal;
                var ltlModifiedDate = e.Item.FindControl(Constants.Controls.LtlModifiedDate) as Literal;
                ltlCreateDate.Text = item.CreatedDate.ToString(this.GetFormatDate());
                ltlModifiedDate.Text = item.ModifiedDate.ToString(this.GetFormatDate());

                // ph
                lblPh.Text = $"{(int)item.Ph} - {this.GetResource(item.Ph.ToString())}";
                crcRgb.Rgb = this.GetPhRgb(item.Ph);
                crcRgb.Checked = true;
                crcRgb.FullCircle = true;

                // fishes
                lblFishes.Text = item.Fishes.Count.ToString();
                lblFishes.ToolTip = this.GetFishesToolTip(item.Fishes);

                // decors
                var toolTip = string.Empty;
                item.Decors.ToList().ForEach((r) => toolTip += r.Name + Constants.HtmlTag.Br);
                lblDecors.Text = item.Decors.Count.ToString();
                lblDecors.ToolTip = toolTip;

                // metadata
                ltlWaterPump.Text = item.WaterPump?.Name;

                // actions
                lnkUpdate.NavigateUrl = $"{Constants.Pages.UpdateTank}?{Constants.QueryStrings.Id}={item.Id}";
                lnkDelete.NavigateUrl = $"{Constants.Pages.DeleteTank}?{Constants.QueryStrings.Id}={item.Id}";
            }
        }


        private string GetFishesToolTip(IList<Fish> fishes)
        {
            var result = string.Empty;
            var fishIdList = new List<int>();

            foreach (var item in fishes)
            {
                var cant = 0;

                if (!fishIdList.Contains(item.Id))
                {
                    fishIdList.Add(item.Id);
                    cant = fishes.Count(x => x.Id == item.Id);

                    result += $"{item.Name}: {cant} <br />";
                }
            }

            return result;
        }
    }
}