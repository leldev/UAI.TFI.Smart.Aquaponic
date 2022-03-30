﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartAquaponic.Web.Decor.Default" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblDecorTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <asp:HyperLink ID="BtnCreate" runat="server" CssClass="btn blue-gradient" />
        <asp:Repeater ID="RptData" runat="server">
            <HeaderTemplate>
                <div class="table-responsive">
                    <table class="table table-hover text-center">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">
                                    <asp:Literal ID="LtlName" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlType" runat="server" />
                                </th>
                                 <th scope="col">
                                    <asp:Literal ID="LtlVolume" runat="server" />
                                </th>
                                <th scope="col" class="d-none d-sm-table-cell">
                                    <asp:Literal ID="LtlCreateDate" runat="server" />
                                </th>
                                <th scope="col" class="d-none d-sm-table-cell">
                                    <asp:Literal ID="LtlModifiedDate" runat="server" />
                                </th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <th scope="row">
                        <%#Eval(nameof(SmartAquaponic.Common.Interfaces.IEntity.Id)) %>
                    </th>
                    <td class="font-weight-bold">
                        <%#Eval(nameof(SmartAquaponic.Domain.Decor.Name))%>
                    </td>
                    <td>
                         <%#Eval(nameof(SmartAquaponic.Domain.Decor.Type))%>
                    </td>
                     <td>
                         <%#Eval(nameof(SmartAquaponic.Domain.Decor.Volume))%> cm<sup>3</sup>
                    </td>
                    <td class="d-none d-sm-table-cell">
                        <asp:Literal ID="LtlCreateDate" runat="server" />
                    </td>
                    <td class="d-none d-sm-table-cell">
                        <asp:Literal ID="LtlModifiedDate" runat="server" />
                    </td>
                    <td>
                        <asp:HyperLink ID="LnkUpdate" runat="server">
                           <i class="far fa-edit blue-text"></i>
                        </asp:HyperLink>

                        <asp:HyperLink ID="LnkDelete" runat="server">
                            <i class="far fa-trash-alt red-text"></i>
                        </asp:HyperLink>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                </table>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </asp:Panel>
    <br />
    <script type="text/javascript">
        $(document).ready(function () {
            var count = '<%= this.RptData.Items == null ? 0 :  this.RptData.Items.Count %>';

            if (count > 0) {
                $('.table').DataTable({
                    columnDefs: [
                        {
                            visible: false,
                            targets: 0
                        },
                        {
                            visible: false,
                            targets: 4
                        },
                        {
                            visible: false,
                            targets: 5
                        },
                        {
                            orderable: false,
                            targets: 6
                        }
                    ]
                });
            }
        });
    </script>
</asp:Content>
