// --------------------------------------------------------------------
// <copyright file="AlertControl.ascx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Controls
{
    using System;
    using SmartAquaponic.Common.Enum;
    using SmartAquaponic.Common.Helpers;

    /// <summary>
    /// AlertControl.
    /// </summary>
    public partial class AlertControl : System.Web.UI.UserControl
    {
        /// <summary>
        /// Gets or sets Message.
        /// </summary>
        public string Message { get; set; }

        /// <summary>
        /// Gets or sets AlertType.
        /// </summary>
        public BootstrapContextualType AlertType { get; set; }

        /// <summary>
        /// Gets or sets AlertClass.
        /// </summary>
        public string AlertClass { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether IsAlertDismissible.
        /// </summary>
        public bool IsAlertDismissible { get; set; }

        /// <summary>
        /// Binds properties.
        /// </summary>
        public void PropertyBind()
        {
            this.LblMessage.Text = this.Message;
            this.AlertClass = $"{BootstrapHerlper.GetAlertClass(this.AlertType)} {(this.IsAlertDismissible ? BootstrapHerlper.GetAlertDismissibleClass() : string.Empty)}";
            this.BtnDismissAlert.Visible = this.IsAlertDismissible;
        }

        /// <summary>
        /// Page_Load.
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.PropertyBind();
            }
        }
    }
}