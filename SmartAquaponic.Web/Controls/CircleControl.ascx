<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CircleControl.ascx.cs" Inherits="SmartAquaponic.Web.Controls.CircleControl" %>

<asp:Panel ID="PnlCheck" runat="server" CssClass="d-inline">
    <i class="fas fa-check-circle circle1" style="color: <%= this.Rgb %> !important" title="<%= this.TitleTip %>"></i>
</asp:Panel>

<asp:Panel ID="PnlFullCheck" runat="server" CssClass="d-inline">
    <i class="fas fa-circle circle3" style="color: <%= this.Rgb %> !important" title="<%= this.TitleTip %>"></i>
</asp:Panel>

<asp:Panel ID="PnlUnCheck" runat="server" CssClass="d-inline">
    <i class="far fa-circle circle2" style="color: <%= this.Rgb %> !important" title="<%= this.TitleTip %>"></i>
</asp:Panel>
