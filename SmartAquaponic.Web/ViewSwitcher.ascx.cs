// --------------------------------------------------------------------
// <copyright file="ViewSwitcher.ascx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web
{
    using System;
    using System.Web;
    using System.Web.Routing;
    using Microsoft.AspNet.FriendlyUrls.Resolvers;

    /// <summary>
    /// ViewSwitcher.
    /// </summary>
    public partial class ViewSwitcher : System.Web.UI.UserControl
    {
        /// <summary>
        /// Gets CurrentView.
        /// </summary>
        protected string CurrentView { get; private set; }

        /// <summary>
        /// Gets AlternateView.
        /// </summary>
        protected string AlternateView { get; private set; }

        /// <summary>
        /// Gets SwitchUrl.
        /// </summary>
        protected string SwitchUrl { get; private set; }

        /// <summary>
        /// Page_Load.
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            // Determine current view
            var isMobile = WebFormsFriendlyUrlResolver.IsMobileView(new HttpContextWrapper(this.Context));
            this.CurrentView = isMobile ? "Mobile" : "Desktop";

            // Determine alternate view
            this.AlternateView = isMobile ? "Desktop" : "Mobile";

            // Create switch URL from the route, e.g. ~/__FriendlyUrls_SwitchView/Mobile?ReturnUrl=/Page
            var switchViewRouteName = "AspNet.FriendlyUrls.SwitchView";
            var switchViewRoute = RouteTable.Routes[switchViewRouteName];
            if (switchViewRoute == null)
            {
                // Friendly URLs is not enabled or the name of the switch view route is out of sync
                this.Visible = false;
                return;
            }

            var url = this.GetRouteUrl(switchViewRouteName, new { view = this.AlternateView, __FriendlyUrls_SwitchViews = true });
            url += "?ReturnUrl=" + HttpUtility.UrlEncode(this.Request.RawUrl);
            this.SwitchUrl = url;
        }
    }
}