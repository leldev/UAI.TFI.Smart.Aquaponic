﻿// --------------------------------------------------------------------
// <copyright file="Default.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.UserPreference
{
    using System;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using SmartAquaponic.Business;
    using SmartAquaponic.Common.Enum;
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
            this.BtnCreate.NavigateUrl = Constants.Pages.CreateUserPreference;
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
                this.IsUserAuthorized(Constants.Permission.ReadLanguage);
                this.SetControls();
                this.LoadData();
            }
        }

        private void LoadData()
        {
            var result = new UserPreferenceBll().Read();

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
                var item = e.Item.DataItem as UserPreference;

                var lnkUpdate = e.Item.FindControl(Constants.Controls.LnkUpdate) as HyperLink;
                var lnkDelete = e.Item.FindControl(Constants.Controls.LnkDelete) as HyperLink;
                var circleControl = e.Item.FindControl(Constants.Controls.CircleControl) as CircleControl;

                // dates
                var ltlCreateDate = e.Item.FindControl(Constants.Controls.LtlCreateDate) as Literal;
                var ltlModifiedDate = e.Item.FindControl(Constants.Controls.LtlModifiedDate) as Literal;
                ltlCreateDate.Text = item.CreatedDate.ToString(this.GetFormatDate());
                ltlModifiedDate.Text = item.ModifiedDate.ToString(this.GetFormatDate());

                lnkUpdate.NavigateUrl = $"{Constants.Pages.UpdateUserPreference}?{Constants.QueryStrings.Id}={item.Id}";
                lnkDelete.NavigateUrl = $"{Constants.Pages.DeleteUserPreference}?{Constants.QueryStrings.Id}={item.Id}";
                circleControl.Checked = item.IsDefault;
            }
        }
    }
}