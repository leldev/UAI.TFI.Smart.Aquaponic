﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartAquaponic.Web.Pot.Default" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>
<%@ Register Src="~/Controls/CircleControl.ascx" TagName="CircleControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblPotTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
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
                                    <asp:Literal ID="LtlRgb" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlPlants" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlHeigth" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlLength" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlWidth" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlRock" runat="server" />
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
                        <%#Eval(nameof(SmartAquaponic.Domain.Pot.Name))%>
                    </td>
                    <td>
                        <sa:CircleControl ID="CrcRgb" runat="server" />
                    </td>
                    <td>
                        <asp:Literal ID="LtlPlants" runat="server" />
                    </td>
                    <td>
                        <%#Eval(nameof(SmartAquaponic.Domain.Pot.Heigth))%> cm
                    </td>
                    <td>
                        <%#Eval(nameof(SmartAquaponic.Domain.Pot.Length))%> cm
                    </td>
                    <td>
                        <%#Eval(nameof(SmartAquaponic.Domain.Pot.Width))%> cm
                    </td>
                    <td>
                        <asp:Literal ID="LtlRock" runat="server" />
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
                            orderable: false,
                            targets: 2
                        },
                        {
                            visible: false,
                            targets: 8
                        },
                        {
                            visible: false,
                            targets: 9
                        },
                        {
                            orderable: false,
                            targets: 10
                        }
                    ]
                });
            }
        });
    </script>
</asp:Content>
