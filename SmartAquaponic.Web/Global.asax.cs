// --------------------------------------------------------------------
// <copyright file="Global.asax.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web
{
    using System;
    using System.Web;
    using System.Web.Optimization;
    using System.Web.Routing;

    /// <summary>
    /// Global.
    /// </summary>
    public class Global : HttpApplication
    {
        /// <summary>
        /// Application_Start.
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        public void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}