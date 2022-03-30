// --------------------------------------------------------------------
// <copyright file="RouteConfig.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web
{
    using System.Web.Routing;
    using Microsoft.AspNet.FriendlyUrls;

    /// <summary>
    /// RouteConfig.
    /// </summary>
    public static class RouteConfig
    {
        /// <summary>
        /// RegisterRoutes.
        /// </summary>
        /// <param name="routes">RouteCollection.</param>
        public static void RegisterRoutes(RouteCollection routes)
        {
            FriendlyUrlSettings friendlyUrlSettings = new FriendlyUrlSettings
            {
                AutoRedirectMode = RedirectMode.Permanent,
            };
            var settings = friendlyUrlSettings;
            routes.EnableFriendlyUrls(settings);
        }
    }
}
