<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SmartAquaponic.Web.Contact.Update" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblContactUsTitle" runat="server" Text="Login" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <asp:HiddenField ID="FldModifiedDate" runat="server" />
        <asp:HiddenField ID="FldEmail" runat="server" />
        <section class="login-signin text-center">
            <img class="mb-4" src="Images/logofull.png" alt="" width="200">
            <div class="form-group col-md text-left">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />:
                <asp:Label ID="LblNameValue" runat="server" CssClass="" />
                <br />
                <asp:Label ID="LblEmail" runat="server" CssClass="h4" />:
                <asp:Label ID="LblEmailValue" runat="server" CssClass="" />
                <br />
                <asp:Label ID="LblMessage" runat="server" CssClass="h4" />:
                <asp:Label ID="LblMessageValue" runat="server" CssClass="" />
                <br />
                <asp:Label ID="LblResponse" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtResponse" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" MaxLength="4000" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired" runat="server" />
                </div>
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
