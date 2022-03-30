using Microsoft.Reporting.WebForms;
using SmartAquaponic.Business;
using SmartAquaponic.Common.Enum;
using SmartAquaponic.Web.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Constants = SmartAquaponic.Common.Constants.WebConstant;

namespace SmartAquaponic.Web.Report
{
    public partial class NotUsed : CustomPage
    {
        /// <inheritdoc/>
        internal override void SetControls()
        {
            this.SetResources(this.Controls);
        }


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

        private void Build()
        {
            if (this.IsUserLogged())
            {
                this.IsUserAuthorized(Constants.Permission.Reports);
                this.SetControls();
                this.LoadData();
            }
        }

        private void LoadData()
        {
            // parameters
            var parameters = new List<ReportParameter>()
            {
                new ReportParameter("CreatedBy", this.GetResource(Constants.Resources.CreatedBy)),
                new ReportParameter("CreatedByValue", this.GetUser()?.ToString()),
                new ReportParameter("CreatedDate", this.GetResource(Constants.Resources.CreatedDate)),
                new ReportParameter("CreatedDateValue", DateTime.Now.ToString(this.GetFormatDate())),
                new ReportParameter("HeaderType", this.GetResource(Constants.Resources.HeaderType)),
                new ReportParameter("HeaderName", this.GetResource(Constants.Resources.HeaderName)),
                new ReportParameter("Pages", this.GetResource(Constants.Resources.Pages)),
                new ReportParameter("Title", this.GetResource(Constants.Controls.LtlReportNotUsedTitle)),
            };

            this.ReportViewer.ProcessingMode = ProcessingMode.Local;
            this.ReportViewer.LocalReport.ReportPath = Server.MapPath("~/Report/NotUsed.rdlc");
            var result = new ReportBll().GetNotUsed();
            var dataSource = new ReportDataSource("DataSet", result);
            this.ReportViewer.LocalReport.DataSources.Clear();
            this.ReportViewer.LocalReport.SetParameters(parameters);
            this.ReportViewer.LocalReport.DataSources.Add(dataSource);
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
    }
}