// --------------------------------------------------------------------
// <copyright file="Default.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web
{
    using SmartAquaponic.Web.Base;
    using System;
    using System.Web.UI;

    /// <summary>
    /// _Default.
    /// </summary>
    public partial class Default : CustomPage
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
            if (!this.IsPostBack)
            {
                this.Build();
            }
        }

        private void Build()
        {
            this.SetControls();
        }
    }
}