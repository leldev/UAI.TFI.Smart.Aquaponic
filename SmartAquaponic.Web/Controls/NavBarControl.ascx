<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavBarControl.ascx.cs" Inherits="SmartAquaponic.Web.Controls.NavBarControl" %>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="/">
        <img id="animateLogo" src="/Images/logo.png" width="100" alt="Smart Aquaponic" style="display: none" loading="lazy">
        <img id="mainLogo" src="/Images/logo.png" width="50" height="30" alt="Smart Aquaponic" loading="lazy">Smart Aquaponic
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <asp:Literal ID="LtlMenuBackOffice" runat="server" />
            <asp:Literal ID="LtlMenuInventory" runat="server" />
            <asp:Literal ID="LtlMenuProduct" runat="server" />
            <asp:Literal ID="LtlMenuComunication" runat="server" />
            <asp:Literal ID="LtlMenuReports" runat="server" />
        </ul>
        <ul class="navbar-nav mr-auto login-link">
            <li class="nav-item dropdown">
                <asp:Button ID="BtnEn" Text="EN" runat="server" CssClass="dropdown-item nav-link" OnClick="BtnEn_Click" />
            </li>
            <li class="nav-item dropdown">
                <asp:Button ID="BtnEs" Text="ES" runat="server" CssClass="dropdown-item nav-link" OnClick="BtnEs_Click" />
            </li>
            <asp:Literal ID="LtlContactUs" runat="server" />
            <asp:Literal ID="LtlMenuUser" runat="server" />
            <asp:Literal ID="LtlMenuLogin" runat="server" />
        </ul>
    </div>
</nav>
