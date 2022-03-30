<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SmartAquaponic.Web.Permission.Create" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblCreatePermissionTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <div class="form-row">
            <div class="form-group col-xl-4 col-sm-12">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" MaxLength="255" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired" runat="server"></asp:Label>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-12 col-xl-10">
                <asp:Label ID="LblRoles" runat="server" CssClass="h4" />
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
                                <asp:CheckBox ID="CbxRole" runat="server" AutoPostBack="false" />
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
            <div class="form-group col-12 col-xl-10">
                <asp:Label ID="LblGroups" runat="server" CssClass="h4" />
                <asp:Repeater ID="RptGroups" runat="server">
                    <HeaderTemplate>
                        <br />
                        <br />
                        <div class="row" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="col-12 col-sm-6 col-md-6 col-lg-4 col-xl-3 ">
                            <div class="checkbox checkbox-primary">
                                <asp:HiddenField ID="FldId" runat="server" />
                                <asp:CheckBox ID="CbxRole" runat="server" AutoPostBack="false" data-toggle="tooltip" data-html="true" />
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
            sa.util.validateForm();
        });
     </script>
</asp:Content>
