<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SmartAquaponic.Web.User.Create" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblCreateUserTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <div class="form-row">
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" MaxLength="255" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired" runat="server" />
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblLastName" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtLastName" runat="server" CssClass="form-control" MaxLength="255" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired1" runat="server" />
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblEmail" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtEmail" runat="server" TextMode="Email" CssClass="form-control" MaxLength="255" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired3" runat="server" />
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblUsername" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtUsername" runat="server" CssClass="form-control-plaintext" MaxLength="50" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired2" runat="server" />
                </div>
            </div>
            <div class="form-group col-md-4 col-sm-12">
                <asp:Label ID="LblPassword" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control-plaintext" MaxLength="50" />
                <asp:Button ID="BtnGeneratePassowrd" runat="server" OnClientClick="return false" CssClass="btn btn-link btn-sm text-muted" />
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblLanguage" runat="server" CssClass="h4" />
                <asp:DropDownList ID="DdlLanguage" runat="server" CssClass="browser-default custom-select" />
            </div>
        </div>
        <div class="form-row">
            
        </div>
        <div class="form-row">
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
                                <asp:CheckBox ID="CbxRole" runat="server" data-toggle="tooltip" data-html="true" AutoPostBack="false" />
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
            <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" CssClass="btn blue-gradient" />
        </div>
    </asp:Panel>
    <script type="text/javascript">
        ready(() => {
            document.querySelector('#<%= this.BtnGeneratePassowrd.ClientID %>').addEventListener("click", () => {
                sa.module.user.setPassword('#<%= this.TxtPassword.ClientID %>');
            });

            var name = '#<%= this.TxtName.ClientID %>';
            var lastname = '#<%= this.TxtLastName.ClientID %>';
            var username = '#<%= this.TxtUsername.ClientID %>';

            document.querySelector(name).addEventListener("keyup", () => {
                sa.module.user.createUsername(name, lastname, username);
            });

            document.querySelector(lastname).addEventListener("keyup", () => {
                sa.module.user.createUsername(name, lastname, username);
            });

            sa.util.validateForm();
        });
    </script>
</asp:Content>
