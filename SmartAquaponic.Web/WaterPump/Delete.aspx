<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="SmartAquaponic.Web.WaterPump.Delete" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblDeleteWaterPumpTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
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
                <asp:Label ID="LblFlowRate" runat="server" CssClass="h4" />:
                <asp:Label ID="LblFlowRateValue" runat="server" />
            </div>
        </div>
         <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblPower" runat="server" CssClass="h4" />:
                <asp:Label ID="LblPowerValue" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LblVolume" runat="server" CssClass="h4" />:
                <asp:Label ID="LblVolumeValue" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <asp:Button ID="BtnDelete" runat="server" OnClick="BtnDelete_Click" CssClass="btn blue-gradient" />
        </div>
    </asp:Panel>
</asp:Content>
