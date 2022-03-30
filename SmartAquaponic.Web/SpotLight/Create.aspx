<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SmartAquaponic.Web.SpotLight.Create" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>
<%@ Register Src="~/Controls/CircleControl.ascx" TagName="CircleControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblCreateSpotLightTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <div class="form-row">
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" MaxLength="50" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired" runat="server" />
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblSlots" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtSlots" runat="server" TextMode="Number" CssClass="form-control" required="" MaxLength="3" max="999" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired1" runat="server" />
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblSocket" runat="server" CssClass="h4" />
                <asp:DropDownList ID="DdlSocket" runat="server" CssClass="browser-default custom-select" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblHeigth" runat="server" CssClass="h4" />
                <div class="input-group">
                    <asp:TextBox ID="TxtHeigth" runat="server" TextMode="Number" min="0" max="100" step=".01" CssClass="form-control" required="" />
                    <div class="input-group-prepend">
                        <div class="input-group-text">cm</div>
                    </div>
                    <div class="invalid-feedback">
                        <asp:Label ID="LblRequired2" runat="server" />
                    </div>
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblLength" runat="server" CssClass="h4" />
                <div class="input-group">
                    <asp:TextBox ID="TxtLength" runat="server" TextMode="Number" min="0" max="100" step=".01" CssClass="form-control" required="" />
                    <div class="input-group-prepend">
                        <div class="input-group-text">cm</div>
                    </div>
                    <div class="invalid-feedback">
                        <asp:Label ID="LblRequired3" runat="server" />
                    </div>
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblWidth" runat="server" CssClass="h4" />
                <div class="input-group">
                    <asp:TextBox ID="TxtWidth" runat="server" TextMode="Number" min="0" max="100" step=".01" CssClass="form-control" required="" />
                    <div class="input-group-prepend">
                        <div class="input-group-text">cm</div>
                    </div>
                    <div class="invalid-feedback">
                        <asp:Label ID="LblRequired5" runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4 col-sm-12">
                <asp:Label ID="LblLamp" runat="server" CssClass="h4" />
                <asp:DropDownList ID="DdlLamp" runat="server" CssClass="browser-default custom-select" />
            </div>
        </div>
        <div class="form-row">
            <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" CssClass="btn blue-gradient" />
        </div>
    </asp:Panel>
    <script type="text/javascript">
        ready(() => {
            sa.util.validateForm();
        });
    </script>
</asp:Content>
