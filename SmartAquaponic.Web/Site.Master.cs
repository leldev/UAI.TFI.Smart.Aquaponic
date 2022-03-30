// --------------------------------------------------------------------
// <copyright file="Site.Master.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web
{
    using System;
    using System.Web.UI;

    /// <summary>
    /// SiteMaster.
    /// </summary>
    public partial class SiteMaster : MasterPage
    {
        /// <summary>
        /// Page_Load.
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //var ipAdd = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            //var ipAdd2 = Request.ServerVariables["REMOTE_ADDR"];

            //var userip = Request.UserHostAddress;
            //if (Request.UserHostAddress != null)
            //{
            //    Int64 macinfo = new Int64();
            //    string macSrc = macinfo.ToString("X");
            //    if (macSrc == "0")
            //    {
            //        if (userip == "127.0.0.1")
            //        {
            //            Response.Write("visited Localhost!");
            //        }
            //    }
            //}
        }
    }
}