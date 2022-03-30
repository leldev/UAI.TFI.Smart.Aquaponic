// --------------------------------------------------------------------
// <copyright file="NavBarControl.ascx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Controls
{
    using SmartAquaponic.Common.Helpers;
    using SmartAquaponic.Common.Model;
    using SmartAquaponic.Domain;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// NavBarControl.
    /// </summary>
    public partial class NavBarControl : UserControl
    {
        /// <summary>
        /// User.
        /// </summary>
        public User User { get; set; }

        /// <summary>
        /// Language.
        /// </summary>
        public string Language { get; set; }

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
                throw ex;
            }
        }

        private void Build()
        {
            this.User = this.Session[Constants.Sessions.UserLogged] as User;
            this.Language = this.Session[Constants.Sessions.Language] as string;

            if (this.User == null)
            {
                this.BuildLogin();
            }
            else
            {
                this.BuildMenu();
            }
        }

        private void BuildLogin()
        {
            this.LtlMenuLogin.Text = new Menu(this.GetResourceValue(Constants.Resources.MenuLogin), Constants.Pages.Login).ToString();
            this.LtlContactUs.Text = new Menu(this.GetResourceValue(Constants.Resources.MenuContacUs), Constants.Pages.ContactUsCreate).ToString();
        }

        private void BuildMenu()
        {
            this.BtnEn.Visible = false;
            this.BtnEs.Visible = false;

            this.LtlMenuBackOffice.Text = this.GetBackOfficeMenu();
            this.LtlMenuInventory.Text = this.GetInventoryMenu();
            this.LtlMenuProduct.Text = this.GetProductMenu();
            this.LtlMenuComunication.Text = this.GetComunicationMenu();
            this.LtlMenuReports.Text = this.GetReportsMenu();

            this.LtlMenuLogin.Text = new Menu(this.GetResourceValue(Constants.Resources.MenuLogout), Constants.Pages.Logout).ToString();
            this.LtlMenuUser.Text = new Menu(User.ToString(), Constants.Pages.UpdateCurrentUserPreference).ToString();
        }

        private string GetReportsMenu()
        {
            var menu = new Menu(this.GetResourceValue(Constants.Resources.MenuReports), string.Empty)
            {
                Items = new List<Menu>()
                {
                    new Menu(this.GetResourceValue(Constants.Resources.MenuReportsNotUsed), Constants.Pages.ReportNotUsed, new List<string>()
                    {
                        Constants.Permission.Reports,
                    }),
                    new Menu(this.GetResourceValue(Constants.Resources.MenuReportsMostUsed), Constants.Pages.ReportMostUsed, new List<string>()
                    {
                        Constants.Permission.Reports,
                    }),
                    new Menu(this.GetResourceValue(Constants.Resources.MenuLogs), Constants.Pages.ReportLogs, new List<string>()
                    {
                        Constants.Permission.Reports,
                    }),
                    },
            };

            this.ValidatePermission(menu);

            return menu.ToString();
        }

        private string GetComunicationMenu()
        {
            var menu = new Menu(this.GetResourceValue(Constants.Resources.MenuComunication), string.Empty)
            {
                Items = new List<Menu>()
                {
                    new Menu(this.GetResourceValue(Constants.Resources.MenuComunication), Constants.Pages.ContactUs, new List<string>()
                    {
                        Constants.Permission.Communication,
                    }),
                    },
            };

            this.ValidatePermission(menu);

            return menu.ToString();
        }

        private string GetProductMenu()
        {
            var menu = new Menu(this.GetResourceValue(Constants.Resources.MenuProduct), string.Empty)
            {
                Items = new List<Menu>()
                {
                    new Menu(this.GetResourceValue(Constants.Resources.MenuProductManagement), Constants.Pages.Product, new List<string>()
                    {
                        Constants.Permission.ProductManagement,
                    }),
                    },
            };

            this.ValidatePermission(menu);

            return menu.ToString();
        }

        private string GetBackOfficeMenu()
        {
            var menu = new Menu(this.GetResourceValue(Constants.Resources.MenuBackOffice), string.Empty)
            {
                Items = new List<Menu>()
                {
                    new Menu(this.GetResourceValue(Constants.Resources.MenuUserManagement), Constants.Pages.User, new List<string>()
                    {
                        Constants.Permission.CreateUser,
                        Constants.Permission.DeleteUser,
                        Constants.Permission.ReadUser,
                        Constants.Permission.RecoveryUser,
                        Constants.Permission.UpdateUser,
                    }),
                    new Menu(this.GetResourceValue(Constants.Resources.MenuLogs), Constants.Pages.Logs, new List<string>()
                    {
                        Constants.Permission.Log,
                    }),
                    new Menu(this.GetResourceValue(Constants.Resources.MenuPermissionManager), Constants.Pages.Permission, new List<string>()
                    {
                        Constants.Permission.CreatePermission,
                        Constants.Permission.DeletePermission,
                        Constants.Permission.ReadPermission,
                        Constants.Permission.UpdatePermission,
                    }),
                    new Menu(this.GetResourceValue(Constants.Resources.MenuDatabaseManagement), Constants.Pages.Database, new List<string>()
                    {
                        Constants.Permission.DbIntegrity,
                        Constants.Permission.DbResetIntegrity,
                        Constants.Permission.Backup,
                        Constants.Permission.Restore,
                    }),
                    new Menu(this.GetResourceValue(Constants.Resources.MenuLanguageManagemenet), Constants.Pages.UserPreference, new List<string>()
                    {
                        Constants.Permission.CreateLanguage,
                        Constants.Permission.DeleteLanguage,
                        Constants.Permission.ReadLanguage,
                        Constants.Permission.UpdateLanguage,
                    }),
                },
            };

            this.ValidatePermission(menu);

            return menu.ToString();
        }

        private string GetInventoryMenu()
        {
            var menu = new Menu(this.GetResourceValue(Constants.Resources.MenuInventory), string.Empty)
            {
                Items = new List<Menu>()
                {
                    new Menu(this.GetResourceValue(Constants.Resources.MenuTankManagement), Constants.Pages.Tank, new List<string>()
                    {
                        Constants.Permission.TankManagement,
                    }),
                    new Menu(this.GetResourceValue(Constants.Resources.MenuFishManagement), Constants.Pages.Fish, new List<string>()
                    {
                        Constants.Permission.FishManagement,
                    }),
                    new Menu(this.GetResourceValue(Constants.Resources.MenuDecorManagement), Constants.Pages.Decor, new List<string>()
                    {
                        Constants.Permission.DecorManagement,
                    }),
                    new Menu(this.GetResourceValue(Constants.Resources.MenuWaterPumpManagement), Constants.Pages.WaterPump, new List<string>()
                    {
                        Constants.Permission.WaterPumpManagement,
                    }),
                    new Menu(this.GetResourceValue(Constants.Resources.MenuPotManagement), Constants.Pages.Pot, new List<string>()
                    {
                        Constants.Permission.PotManagement,
                    }),
                    new Menu(this.GetResourceValue(Constants.Resources.MenuPlantManagement), Constants.Pages.Plant, new List<string>()
                    {
                        Constants.Permission.PlantManagement,
                    }),
                    new Menu(this.GetResourceValue(Constants.Resources.MenuSpotLightManagement), Constants.Pages.SpotLight, new List<string>()
                    {
                        Constants.Permission.SpotligthManagement,
                    }),
                    new Menu(this.GetResourceValue(Constants.Resources.MenuLampManagement), Constants.Pages.Lamp, new List<string>()
                    {
                        Constants.Permission.LampManagement,
                    }),
                },
            };

            this.ValidatePermission(menu);

            return menu.ToString();
        }

        private void ValidatePermission(Menu menu)
        {
            foreach (var item in menu.Items)
            {
                var display = false;

                foreach (var role in item.Roles)
                {
                    if (this.IsUserAuthorized(role))
                    {
                        display = true;
                        break;
                    }
                }

                item.Display = display;
            }

            menu.Display = menu.Items.Any(x => x.Display);
        }

        private bool IsUserAuthorized(string role)
        {
            var result = false;

            foreach (var item in this.User.Roles)
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

            return result;
        }

        private string GetResourceValue(string key)
        {
            var result = string.Empty;

            if (this.User == null && this.User?.Preference == null)
            {
                result = ResourceHelper.GerLocalResourceValue(this.Language, key);
            }
            else
            {
                result = this.User.Preference.Resources.FirstOrDefault(x => x.Key.Equals(key))?.Value;
            }

            return string.IsNullOrEmpty(result) ? ResourceHelper.GerResourceValue(key) : result;
        }

        protected void BtnEn_Click(object sender, EventArgs e)
        {
            this.SetLanguage(Constants.Languages.English);
        }

        protected void BtnEs_Click(object sender, EventArgs e)
        {
            this.SetLanguage(Constants.Languages.Spanish);
        }

        private void SetLanguage(string lang)
        {
            Session.Add(Constants.Sessions.Language, lang);

            this.Response.Redirect(HttpContext.Current.Request.ApplicationPath, false);
        }
    }
}