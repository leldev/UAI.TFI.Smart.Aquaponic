<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Password.aspx.cs" Inherits="SmartAquaponic.Web.User.Password" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblRecoveryPasswordTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <asp:Panel ID="PnlRecoveryByEmail" runat="server" Visible="false">
            <section class="login-signin text-center">
                <img class="mb-4" src="../Images/logofull.png" alt="" width="200">
                <div class="form-group col-md text-left">
                    <asp:Label ID="LblEnterEmail" runat="server" CssClass="h4" />
                    <asp:TextBox ID="TxtEmail" runat="server" TextMode="Email" CssClass="form-control" MaxLength="255" required="" />
                    <div class="invalid-feedback">
                        <asp:Label ID="LblRequired" runat="server" />
                    </div>
                </div>
                <asp:Button ID="BtnRecoveryPassword" runat="server" OnClick="BtnGeneratePassword_Click" CssClass="btn blue-gradient" />
            </section>
        </asp:Panel>
        <asp:Panel ID="PnlRecoveryByUserId" runat="server" Visible="false">
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
                <asp:Button ID="BtnGeneratePassword" runat="server" OnClick="BtnGeneratePassword_Click" CssClass="btn blue-gradient" />
            </div>
        </asp:Panel>
    </asp:Panel>
    <script type="text/javascript">
        sa.util.validateForm();
    </script>
</asp:Content>
