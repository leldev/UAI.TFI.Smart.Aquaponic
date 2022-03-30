// --------------------------------------------------------------------
// <copyright file="Preference.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.User
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.UI.WebControls;
    using SmartAquaponic.Business;
    using SmartAquaponic.Common.Enum;
    using SmartAquaponic.Common.Extensions;
    using SmartAquaponic.Common.Helpers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Web.Base;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// Update.
    /// </summary>
    public partial class Preference : CustomPage
    {
        /// <summary>
        /// Gets or sets User.
        /// </summary>
        private new User User { get; set; }

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

        /// <summary>
        /// BtnSave_Click.
        /// </summary>
        /// <param name="sender">sender.</param>
        /// <param name="e">e.</param>
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.IsEntityValid())
                {
                    var roles = this.GetSelectedRoles();
                    var user = this.GetUser();

                    var result = new UserBll(this.GetUser(), this.GetIp()).Update(new User()
                    {
                        Id = user.Id,
                        ModifiedDate = Convert.ToDateTime(this.FldModifiedDate.Value),
                        Name = this.TxtName.Text,
                        LastName = this.TxtLastName.Text,
                        Preference = new UserPreference()
                        {
                            Id = Convert.ToInt32(this.DdlLanguage.SelectedValue),
                        },
                        Roles = roles,
                    });

                    if (result > 0)
                    {
                        user.Preference = new UserPreferenceBll().Read(Convert.ToInt32(this.DdlLanguage.SelectedValue));
                        user.Name = this.TxtName.Text;
                        user.LastName = this.TxtLastName.Text;

                        this.SaveUserSession(user);

                        this.Response.Redirect(Constants.Pages.Default, false);
                    }
                    else
                    {
                        this.ShowError(this.GetResource(result));
                    }
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
                this.SetControls();
                this.LoadData();
            }
        }

        private void LoadData()
        {
            var user = this.GetUser();

            if (user?.Id == 0)
            {
                this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
            }
            else
            {
                this.User = new UserBll().Read(user.Id);

                if (this.User == null)
                {
                    this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
                }
                else
                {
                    this.TxtName.Text = this.User.Name;
                    this.TxtLastName.Text = this.User.LastName;
                    this.FldModifiedDate.Value = this.User.ModifiedDate.ToDateTime2();

                    this.LoadUserPreference();

                    this.RptData.ItemDataBound += this.RptData_ItemDataBound;
                    this.RptData.DataSource = new PermissionBll().GetRolesAndGroups();
                    this.RptData.DataBind();
                }
            }
        }

        private void LoadUserPreference()
        {
            this.DdlLanguage.DataSource = new UserPreferenceBll().Read();
            this.DdlLanguage.DataTextField = nameof(UserPreference.Name);
            this.DdlLanguage.DataValueField = nameof(UserPreference.Id);
            this.DdlLanguage.DataBind();
            this.DdlLanguage.SelectedValue = this.User.Preference.Id.ToString();
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
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var role = e.Item.DataItem as Role;

                var cbx = e.Item.FindControl(Constants.Controls.CbxRole) as CheckBox;
                var fld = e.Item.FindControl(Constants.Controls.FldId) as HiddenField;

                cbx.Text = role.Name;
                cbx.Checked = this.User.Roles.Any(x => x.Id.Equals(role.Id));
                fld.Value = role.Id.ToString();

                if (role is Group)
                {
                    var group = role as Group;
                    var roles = string.Empty;

                    group.Roles.ToList().ForEach((r) => roles += r.Name + Constants.HtmlTag.Br);

                    cbx.ToolTip = roles;
                }
            }
        }

        private bool IsEntityValid()
        {
            var result = true;

            if (string.IsNullOrEmpty(this.TxtName.Text))
            {
                this.TxtName.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtName.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            if (string.IsNullOrEmpty(this.TxtLastName.Text))
            {
                this.TxtLastName.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtLastName.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            return result;
        }

        private List<Role> GetSelectedRoles()
        {
            var roles = new List<Role>();
            foreach (RepeaterItem item in this.RptData.Items)
            {
                var cbx = item.FindControl(Constants.Controls.CbxRole) as CheckBox;
                var fld = item.FindControl(Constants.Controls.FldId) as HiddenField;
                if (cbx.Checked)
                {
                    roles.Add(new Role()
                    {
                        Id = Convert.ToInt32(fld.Value),
                        Name = cbx.Text,
                    });
                }
            }

            return roles;
        }
    }
}