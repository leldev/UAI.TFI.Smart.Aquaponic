<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reset.aspx.cs" Inherits="SmartAquaponic.Web.User.Reset" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblRecoveryPasswordTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <section class="login-signin text-center">
            <img class="mb-4" src="Images/logofull.png" alt="" width="200">
            <div class="form-group col-md text-left">
                <asp:Label ID="LblTempPassword" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtTempPassword" runat="server" TextMode="Password" CssClass="form-control" minlength="8" required />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired" runat="server" />
                </div>
                <br />
                <asp:Label ID="LblNewPassword" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtNewPassword" runat="server" TextMode="Password" CssClass="form-control" minlength="8" required />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired1" runat="server" />
                </div>
                <br />
            </div>
            <asp:Button ID="BtnRecoveryPassword" runat="server" OnClick="BtnRecoveryPassword_Click" CssClass="btn blue-gradient" />
        </section>
    </asp:Panel>
    <script type="text/javascript">
        ready(() => {
            sa.util.validateForm();
        });
    </script>
</asp:Content>
