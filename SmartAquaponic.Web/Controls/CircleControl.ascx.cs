// --------------------------------------------------------------------
// <copyright file="CircleControl.ascx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Controls
{
    using System;

    /// <summary>
    /// CircleControl.
    /// </summary>
    public partial class CircleControl : System.Web.UI.UserControl
    {
        /// <summary>
        /// Gets or sets a value indicating whether Checked.
        /// </summary>
        public bool Checked { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether FullCircle.
        /// </summary>
        public bool FullCircle { get; set; }

        /// <summary>
        /// Rgb.
        /// </summary>
        public string Rgb { get; set; }

        /// <summary>
        /// TitleTip.
        /// </summary>
        public string TitleTip { get; set; }

        /// <summary>
        /// Page_Load
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PnlCheck.Visible = false;
            this.PnlUnCheck.Visible = false;
            this.PnlFullCheck.Visible = false;

            if (this.Checked)
            {
                if (this.FullCircle)
                {
                    this.PnlFullCheck.Visible = true;
                }
                else
                {
                    this.PnlCheck.Visible = true;
                }
            }
            else
            {
                this.PnlUnCheck.Visible = true;
            }
        }
    }
}