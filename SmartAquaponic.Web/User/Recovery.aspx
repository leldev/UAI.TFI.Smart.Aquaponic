<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recovery.aspx.cs" Inherits="SmartAquaponic.Web.User.Recovery" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblDeleteUserTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />:
                <asp:Label ID="LblNameValue" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblLastName" runat="server" CssClass="h4" />:
                <asp:Label ID="LblLastNameValue" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblUsername" runat="server" CssClass="h4" />:
                <asp:Label ID="LblUsernameValue" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblEmail" runat="server" CssClass="h4" />:
                <asp:Label ID="LblEmailValue" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <asp:Button ID="BtnUnlock" runat="server" OnClick="BtnUnlock_Click" CssClass="btn blue-gradient" />
            <asp:Button ID="BtnRecovery" runat="server" OnClick="BtnRecovery_Click" CssClass="btn blue-gradient" />
        </div>
    </asp:Panel>
</asp:Content>
