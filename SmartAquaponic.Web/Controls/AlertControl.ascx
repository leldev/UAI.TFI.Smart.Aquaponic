<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AlertControl.ascx.cs" Inherits="SmartAquaponic.Web.Controls.AlertControl" %>

<div class="alert <%= this.AlertClass %> text-center" role="alert">
    <asp:Label ID="LblMessage" runat="server" />
    <button id="BtnDismissAlert" runat="server" type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
