// --------------------------------------------------------------------
// <copyright file="Update.aspx.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Web.UserPreference
{
    using System;
    using System.Collections.Generic;
    using System.Diagnostics;
    using System.Linq;
    using System.Threading.Tasks;
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
                    List<Resource> resources = this.GetSelectedResources();

                    if (resources != null)
                    {
                        var result = new UserPreferenceBll(this.GetUser(), this.GetIp()).Update(new UserPreference()
                        {
                            Id = Convert.ToInt32(this.Request.QueryString[Constants.QueryStrings.Id]),
                            ModifiedDate = Convert.ToDateTime(this.FldModifiedDate.Value),
                            Name = this.TxtName.Text,
                            DateFormat = this.TxtDateFormat.Text,
                            TimeZone = this.TxtTimeZone.Text,
                            Resources = resources,
                        });

                        if (result > 0)
                        {
                            this.Response.Redirect(Constants.Pages.UserPreference, false);
                        }
                        else
                        {
                            this.ShowError(this.GetResource(result));
                        }
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
                var userPreference = new UserPreferenceBll().Read(id);

                if (userPreference == null)
                {
                    this.ShowError(this.GetResource(Constants.Errors.NoResultsFound), hideMainPanel: true);
                }
                else
                {
                    foreach (var item in ResourceHelper.GetLanguageList())
                    {
                        DdlLanguage.Items.Add(new ListItem(item.Key, item.Value));
                    }

                    this.TxtName.Text = userPreference.Name;
                    this.TxtDateFormat.Text = userPreference.DateFormat;
                    this.TxtTimeZone.Text = userPreference.TimeZone;
                    this.FldModifiedDate.Value = userPreference.ModifiedDate.ToDateTime2();

                    this.RptData.ItemDataBound += this.RptData_ItemDataBound;
                    this.RptData.DataSource = userPreference.Resources;
                    this.RptData.DataBind();
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
            this.SetResources(e.Item.Controls);

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var resource = e.Item.DataItem as Resource;
                var fldId = e.Item.FindControl(Constants.Controls.FldId) as HiddenField;
                var fldKey = e.Item.FindControl(Constants.Controls.FldKey) as HiddenField;
                var fldValue = e.Item.FindControl(Constants.Controls.FldValue) as HiddenField;
                var txtValue = e.Item.FindControl(Constants.Controls.TxtValue) as TextBox;

                fldKey.Value = resource.Key;
                fldId.Value = resource.Id.ToString();
                fldValue.Value = resource.Value;
                txtValue.Text = resource.Value;
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

            if (string.IsNullOrEmpty(this.TxtDateFormat.Text))
            {
                this.TxtDateFormat.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtDateFormat.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            if (string.IsNullOrEmpty(this.TxtTimeZone.Text))
            {
                this.TxtTimeZone.CssClass = BootstrapHerlper.GetInvalidFormClass();
                result = false;
            }
            else
            {
                this.TxtTimeZone.CssClass = BootstrapHerlper.GetValidFormClass();
            }

            return result;
        }

        private List<Resource> GetSelectedResources()
        {
            var resources = new List<Resource>();

            foreach (RepeaterItem item in this.RptData.Items)
            {
                var fldId = item.FindControl(Constants.Controls.FldId) as HiddenField;
                var fldKey = item.FindControl(Constants.Controls.FldKey) as HiddenField;
                var fldValue = item.FindControl(Constants.Controls.FldValue) as HiddenField;
                var txtValue = item.FindControl(Constants.Controls.TxtValue) as TextBox;

                if (string.IsNullOrEmpty(txtValue.Text))
                {
                    txtValue.CssClass = BootstrapHerlper.GetInvalidFormClass();
                    resources = null;
                }

                if (resources != null)
                {
                    if (fldValue.Value != txtValue.Text || !string.IsNullOrEmpty(this.FldIgnoreValidation.Value))
                    {
                        resources.Add(new Resource()
                        {
                            Id = Convert.ToInt32(fldId.Value),
                            Key = fldKey.Value,
                            Value = txtValue.Text,
                        });
                    }
                }
            }

            return resources;
        }

        protected async void BtnTranslate_Click(object sender, EventArgs e)
        {
            try
            {
                var result = new UserPreferenceBll().Read(1);

                var resourseKeyValue = result.Resources.ToDictionary(x => x.Key, x => x.Value);

                var translate = await ResourceHelper.Translate(resourseKeyValue, this.DdlLanguage.SelectedValue).ConfigureAwait(false);

                for (int i = 0; i < translate.Count; i++)
                {
                    var r = result.Resources[i];
                    r.Value = translate[r.Key];
                }

                FldIgnoreValidation.Value = true.ToString();

                this.RptData.ItemDataBound += this.RptData_ItemDataBound;
                this.RptData.DataSource = result.Resources;
                this.RptData.DataBind();
            }
            catch (Exception ex)
            {
                this.ShowError(this.GetResource(Constants.Errors.UnexpectedError), hideMainPanel: false);
                this.LogMessage(ex);
            }
        }
    }
}