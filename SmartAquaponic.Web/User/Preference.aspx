<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Preference.aspx.cs" Inherits="SmartAquaponic.Web.User.Preference" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblUpdateUserTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <asp:HiddenField ID="FldModifiedDate" runat="server" />
        <div class="form-row">
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" required />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired" runat="server" />
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblLastName" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtLastName" runat="server" CssClass="form-control" required />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired1" runat="server" />
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <div class="form-group">
                <asp:Label ID="LblLanguage" runat="server" CssClass="h4" />
                <asp:DropDownList ID="DdlLanguage" runat="server" CssClass="browser-default custom-select" />
            </div>
            </div>
        </div>
        <div class="form-row d-none">
            <div class="form-group col-12 col-xl-10">
                <asp:Label ID="LblPermission" runat="server" CssClass="h4" />
                <asp:Repeater ID="RptData" runat="server">
                    <HeaderTemplate>
                        <br />
                        <br />
                        <div class="row" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="col-12 col-sm-6 col-md-6 col-lg-4 col-xl-3 ">
                            <div class="checkbox checkbox-primary">
                                <asp:HiddenField ID="FldId" runat="server" />
                                <asp:CheckBox ID="CbxRole" runat="server" data-toggle="tooltip" data-html="true" CssClass="btn-link text-primary" AutoPostBack="false" />
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="form-row">
            <asp:Button ID="BtnUpdate" runat="server" Text="Update" OnClick="BtnUpdate_Click" CssClass="btn blue-gradient" />
        </div>
    </asp:Panel>
    <script type="text/javascript">
        ready(() => {
            sa.util.validateForm();
        });
    </script>
</asp:Content>
