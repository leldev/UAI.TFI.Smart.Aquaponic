<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SmartAquaponic.Web.Plant.Update" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblUpdatePlantTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <asp:HiddenField ID="FldModifiedDate" runat="server" />
        <div class="form-row">
            <div class="form-group col-md-4 col-sm-12">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" MaxLength="50" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired" runat="server" />
                </div>
            </div>
            <div class="form-group col-12">
                <div class="checkbox checkbox-primary h4">
                    <asp:CheckBox ID="CbxIsHydroponic" runat="server" data-toggle="tooltip" data-html="true" CssClass="btn-link text-primary" AutoPostBack="false" />
                </div>
            </div>
            <div class="form-group col-12">
                <div class="checkbox checkbox-primary h4">
                    <asp:CheckBox ID="CbxIsLowLight" runat="server" data-toggle="tooltip" data-html="true" CssClass="btn-link text-primary" AutoPostBack="false" />
                </div>
            </div>
        </div>
        <div class="form-row">
            <asp:Button ID="BtnUpdate" runat="server" OnClick="BtnUpdate_Click" CssClass="btn blue-gradient" />
        </div>
    </asp:Panel>
</asp:Content>

