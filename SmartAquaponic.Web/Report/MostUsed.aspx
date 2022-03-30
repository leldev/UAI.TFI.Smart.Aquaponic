<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MostUsed.aspx.cs" Inherits="SmartAquaponic.Web.Report.MostUsed" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LtlReportMostUsedTitle" runat="server" Text="Login" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl id="AlertControl" runat="server" visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <rsweb:ReportViewer ID="ReportViewer" runat="server" ProcessingMode="Remote" SizeToReportContent="True" />
    </asp:Panel>
</asp:Content>

