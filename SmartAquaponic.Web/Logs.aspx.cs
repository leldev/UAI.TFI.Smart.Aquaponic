// --------------------------------------------------------------------
// <copyright file="Default.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web
{
    using System;
    using System.Web.UI.WebControls;
    using SmartAquaponic.Business;
    using SmartAquaponic.Common.Enum;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Web.Base;
    using SmartAquaponic.Web.Controls;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// Logs.
    /// </summary>
    public partial class Logs : CustomPage
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

        private void Build()
        {
            if (this.IsUserLogged())
            {
                this.IsUserAuthorized(Constants.Permission.Log);
                this.SetControls();
                this.LoadData();
            }
        }

        private void LoadData()
        {
            var result = new LogBll().Read();

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
                var item = e.Item.DataItem as Log;

                var lblEvent = e.Item.FindControl(Constants.Controls.LblEvent) as Label;

                lblEvent.Text = item.Event.ToString();

                switch (item.Event)
                {
                    case Domain.Enum.EventType.Error:
                        lblEvent.CssClass = Constants.CssClassName.TextDanger;
                        break;
                    case Domain.Enum.EventType.Info:
                        lblEvent.CssClass = Constants.CssClassName.TextInfo;
                        break;
                    case Domain.Enum.EventType.Verbose:
                        lblEvent.CssClass = Constants.CssClassName.TextSecondary;
                        break;
                    case Domain.Enum.EventType.Warning:
                        lblEvent.CssClass = Constants.CssClassName.TextWarning;
                        break;
                    default:
                        break;
                }
            }
        }
    }
}