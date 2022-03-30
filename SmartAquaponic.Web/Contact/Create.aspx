<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SmartAquaponic.Web.Contact.Create" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblContactUsTitle" runat="server" Text="Login" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <section class="login-signin text-center">
            <img class="mb-4" src="Images/logofull.png" alt="" width="200">
            <div class="form-group col-md text-left">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" MaxLength="50" required autofocus />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired" runat="server" />
                </div>
                <br />
                <asp:Label ID="LblEmail" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtEmail" runat="server" TextMode="Email" CssClass="form-control" MaxLength="255" required />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired1" runat="server" />
                </div>
                <br />
                <asp:Label ID="LblMessage" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" MaxLength="4000" required />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired2" runat="server" />
                </div>
                <br />
            </div>
            <asp:Button ID="BtnSend" runat="server" OnClick="BtnSend_Click" CssClass="btn blue-gradient" />
        </section>
    </asp:Panel>
    <script type="text/javascript">
        ready(() => {
            sa.util.validateForm();
        });
    </script>
</asp:Content>
