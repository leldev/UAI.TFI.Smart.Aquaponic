<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="SmartAquaponic.Web.UserPreference.Delete" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblDeleteUserPreferenceTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />:
                <asp:Label ID="LblUserPreferenceName" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblDateFormat" runat="server" CssClass="h4" />:
                <asp:Label ID="LblDateFormatValue" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblTimeZone" runat="server" CssClass="h4" />:
                <asp:Label ID="LblTimeZoneValue" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <asp:Button ID="BtnDelete" runat="server" OnClick="BtnDelete_Click" CssClass="btn blue-gradient" />
        </div>
    </asp:Panel>
</asp:Content>
