// --------------------------------------------------------------------
// <copyright file="CustomPage.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Base
{
    using System;
    using System.Linq;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using SmartAquaponic.Business;
    using SmartAquaponic.Common.Execptions;
    using SmartAquaponic.Common.Helpers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Domain.Enum;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// CustomPage.
    /// </summary>
    public abstract class CustomPage : Page
    {
        /// <summary>
        /// Set controls.
        /// </summary>
        internal abstract void SetControls();

        /// <summary>
        /// Get resource.
        /// </summary>
        /// <param name="key">Key.</param>
        /// <returns>Resource as string.</returns>
        internal string GetResource(string key)
        {
            return this.GetResourceValue(key);
        }

        /// <summary>
        /// Get resource.
        /// </summary>
        /// <param name="key">Key.</param>
        /// <returns>Resource as string.</returns>
        internal string GetResource(int key)
        {
            return this.GetResourceValue(key.ToString());
        }

        internal bool IsUserLogged()
        {
            var isUserNull = this.GetUser() == null;

            if (isUserNull)
            {
                this.Response.Redirect(Constants.Pages.Default, false);
            }

            return !isUserNull;
        }

        internal string GetIp()
        {
            var result = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (string.IsNullOrEmpty(result))
            {
                result = Request.ServerVariables["REMOTE_ADDR"];
            }

            return result;
        }

        /// <summary>
        /// Set resources.
        /// </summary>
        /// <param name="controls">ControlCollection.</param>
        internal void SetResources(ControlCollection controls)
        {
            foreach (Control control in controls)
            {
                string resource;

                switch (control)
                {
                    case Label c:
                        resource = this.GetResourceValue(c.ID);
                        if (!string.IsNullOrEmpty(resource))
                        {
                            c.Text = resource;
                        }

                        break;
                    case Button c:
                        resource = this.GetResourceValue(c.ID);
                        if (!string.IsNullOrEmpty(resource))
                        {
                            c.Text = resource;
                        }

                        break;
                    case HyperLink c:
                        resource = this.GetResourceValue(c.ID);
                        if (!string.IsNullOrEmpty(resource))
                        {
                            c.Text = resource;
                        }

                        break;
                    case Literal c:
                        resource = this.GetResourceValue(c.ID);
                        if (!string.IsNullOrEmpty(resource))
                        {
                            c.Text = resource;
                        }

                        break;
                    case CheckBox c:
                        resource = this.GetResourceValue(c.ID);
                        if (!string.IsNullOrEmpty(resource))
                        {
                            c.Text = resource;
                        }

                        break;
                    default:
                        break;
                }

                if (control.Controls != null)
                {
                    this.SetResources(control.Controls);
                }
            }
        }

        internal bool IsUserAuthorized(string role, bool throwException = true)
        {
            var result = false;
            var user = this.GetUser();

            foreach (var item in user.Roles)
            {
                if (item is Group)
                {
                    var group = item as Group;

                    if (group.IsValid(role))
                    {
                        result = true;
                        break;
                    }
                }
                else
                {
                    if (item.IsValid(role))
                    {
                        result = true;
                        break;
                    }
                }
            }

            if (!result && throwException)
            {
                throw new UnauthorizedException(Constants.Messages.Unauthorized, Constants.Errors.Unauthorized);
            }

            return result;
        }

        internal void LogMessage(Exception ex)
        {
            try
            {
                var log = new Log()
                {
                    Event = EventType.Error,
                    Ip = "127.0.0.1",
                    Message = ex.Message,
                    User = this.GetUser(),
                };

                new LogBll().Create(log);
            }
            catch { }
        }

        internal User GetUser()
        {
            return this.Session[Constants.Sessions.UserLogged] as Domain.User;
        }

        internal string GetLanguage()
        {
            return this.Session[Constants.Sessions.Language] as string;
        }

        internal string GetFormatDate()
        {
            var result = "MM/dd/yyyy";

            var user = this.GetUser();

            if (!string.IsNullOrEmpty(user?.Preference?.DateFormat))
            {
                return user.Preference.DateFormat;
            }

            return result;
        }

        internal void SaveUserSession(User user)
        {
            this.Session[Constants.Sessions.UserLogged] = user;
        }

        internal string GetPhRgb(PhType ph)
        {
            var result = "#FFF";

            switch (ph)
            {
                case PhType.Red:
                    result = "#EE3722";
                    break;
                case PhType.Pink:
                    result = "#EE3479";
                    break;
                case PhType.Orange:
                    result = "#F57E26";
                    break;
                case PhType.Beige:
                    result = "#FBA923";
                    break;
                case PhType.Yellow:
                    result = "#F4EC08";
                    break;
                case PhType.LimeGreen:
                    result = "#A3CD39";
                    break;
                case PhType.Green:
                    result = "#4DB847";
                    break;
                case PhType.DarkGreen:
                    result = "#019247";
                    break;
                case PhType.Tarquoise:
                    result = "#059495";
                    break;
                case PhType.PaleBlue:
                    result = "#5175BA";
                    break;
                case PhType.Blue:
                    result = "#454A9F";
                    break;
                case PhType.DarkBlue:
                    result = "#2A2F84";
                    break;
                case PhType.Violet:
                    result = "#94248C";
                    break;
                case PhType.Purple:
                    result = "#7B2779";
                    break;
                default:
                    break;
            }

            return result;
        }

        private string GetResourceValue(string key)
        {
            var result = string.Empty;
            var user = this.GetUser();
            var lang = this.GetLanguage();

            if (user is null && user?.Preference is null)
            {
                result = ResourceHelper.GerLocalResourceValue(lang, key);
            }
            else
            {
                result = user.Preference.Resources.FirstOrDefault(x => x.Key.Equals(key))?.Value;
            }

            return string.IsNullOrEmpty(result) ? ResourceHelper.GerResourceValue(key) : result;
        }
    }
}