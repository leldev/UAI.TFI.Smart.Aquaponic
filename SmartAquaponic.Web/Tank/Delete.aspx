<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="SmartAquaponic.Web.Tank.Delete" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblDeleteTankTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
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
                <asp:Label ID="LblWaterTemp" runat="server" CssClass="h4" />:
                <asp:Label ID="LblWaterTempValue" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblWaterPump" runat="server" CssClass="h4" />:
                <asp:Label ID="LblWaterPumpValue" runat="server" />
            </div>
        </div>
         <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblPh" runat="server" CssClass="h4" />:
                <asp:Label ID="LblPhValue" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblHeigth" runat="server" CssClass="h4" />:
                <asp:Label ID="LblHeigthValue" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblLength" runat="server" CssClass="h4" />:
                <asp:Label ID="LblLengthValue" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblWidth" runat="server" CssClass="h4" />:
                <asp:Label ID="LblWidthValue" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <asp:Button ID="BtnDelete" runat="server" OnClick="BtnDelete_Click" CssClass="btn blue-gradient" />
        </div>
    </asp:Panel>
</asp:Content>
