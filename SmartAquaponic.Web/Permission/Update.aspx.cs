// --------------------------------------------------------------------
// <copyright file="Update.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.Permission
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
    public partial class Update : CustomPage
    {
        /// <summary>
        /// Gets or sets Group.
        /// </summary>
        private Group Group { get; set; }

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
                    var result = new PermissionBll(this.GetUser(), this.GetIp()).Update(new Group()
                    {
                        Id = Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]),
                        ModifiedDate = Convert.ToDateTime(this.FldModifiedDate.Value),
                        Name = this.TxtName.Text,
                        Roles = this.GetSelectedRoles(),
                    });

                    if (result > 0)
                    {
                        this.Response.Redirect(Constants.Pages.Permission, false);
                    }
                    else
                    {
                        this.ShowError(this.GetResource(result.ToString()));
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
                this.IsUserAuthorized(Constants.Permission.UpdateLanguage);
                this.SetControls();
                this.LoadData();
            }
        }

        private void LoadData()
        {
            var id = Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]);

            if (id == 0)
            {
                this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
            }
            else
            {
                this.Group = new PermissionBll().Read(id);

                if (this.Group == null)
                {
                    this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
                }
                else
                {
                    var result = new PermissionBll().GetRolesAndGroups();
                    var groups = new List<Group>();
                    var roles = new List<Role>();

                    foreach (var item in result)
                    {
                        if (item.Id != this.Group.Id)
                        {
                            if (item is Group)
                            {
                                groups.Add(item as Group);
                            }
                            else
                            {
                                roles.Add(item);
                            }
                        }
                    }

                    this.TxtName.Text = this.Group.Name;
                    this.FldModifiedDate.Value = this.Group.ModifiedDate.ToDateTime2();

                    this.RptData.ItemDataBound += this.RptData_ItemDataBound;
                    this.RptData.DataSource = roles;
                    this.RptData.DataBind();

                    this.RptGroups.ItemDataBound += this.RptGroups_ItemDataBound;
                    this.RptGroups.DataSource = groups;
                    this.RptGroups.DataBind();
                }
            }
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
                var item = e.Item.DataItem as Role;

                var cbxRole = e.Item.FindControl(Constants.Controls.CbxRole) as CheckBox;
                var fldId = e.Item.FindControl(Constants.Controls.FldId) as HiddenField;

                cbxRole.Text = item.Name;
                cbxRole.Checked = this.Group.Roles.Any(x => x.Id.Equals(item.Id));
                fldId.Value = item.Id.ToString();
            }
        }

        private void RptGroups_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var item = e.Item.DataItem as Group;

                var cbxRole = e.Item.FindControl(Constants.Controls.CbxRole) as CheckBox;
                var fldId = e.Item.FindControl(Constants.Controls.FldId) as HiddenField;

                // group
                var toolTip = string.Empty;
                item.Roles.ToList().ForEach((r) => toolTip += r.Name + Constants.HtmlTag.Br);
                cbxRole.Text = item.Name;
                cbxRole.ToolTip = toolTip;
                cbxRole.Checked = this.Group.Roles.Any(x => x.Id.Equals(item.Id));

                // metadata
                fldId.Value = item.Id.ToString();
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

            return result;
        }

        private List<Role> GetSelectedRoles()
        {
            var roles = new List<Role>();

            foreach (RepeaterItem item in this.RptData.Items)
            {
                var role = GetRoleFromRepeterItem(item);
                if (role != null)
                {
                    roles.Add(role);
                }
            }

            foreach (RepeaterItem item in this.RptGroups.Items)
            {
                var role = GetRoleFromRepeterItem(item);
                if (role != null)
                {
                    roles.Add(role);
                }
            }

            return roles;
        }

        private Role GetRoleFromRepeterItem(RepeaterItem item)
        {
            Role result = null;

            var cbxRole = item.FindControl(Constants.Controls.CbxRole) as CheckBox;
            var fldId = item.FindControl(Constants.Controls.FldId) as HiddenField;

            if (cbxRole.Checked)
            {
                result = new Role()
                {
                    Id = Convert.ToInt32(fldId.Value),
                    Name = cbxRole.Text,
                };
            }

            return result;
        }
    }
}