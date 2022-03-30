<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartAquaponic.Web.Tank.Default" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>
<%@ Register Src="~/Controls/CircleControl.ascx" TagName="CircleControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblTankTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
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
                                    <asp:Literal ID="LtlWaterTemp" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlPh" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlFishes" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlDecors" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlWaterPump" runat="server" />
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
                        <%#Eval(nameof(SmartAquaponic.Domain.Tank.Name))%>
                    </td>
                    <td>
                        <%#Eval(nameof(SmartAquaponic.Domain.Tank.WaterTemp))%> ºC
                    </td>
                    <td>
                        <asp:Label ID="LblPh" runat="server" />
                        <sa:CircleControl ID="CrcRgb" runat="server" />
                    </td>
                    <td>
                        <asp:Label ID="LblFishes" runat="server" data-toggle="tooltip" data-html="true" CssClass="btn-link text-primary" />
                    </td>
                    <td>
                        <asp:Label ID="LblDecors" runat="server" data-toggle="tooltip" data-html="true" CssClass="btn-link text-primary" />
                    </td>
                    <td>
                        <asp:Literal ID="LtlWaterPump" runat="server" />
                    </td>
                    <td>
                        <%#Eval(nameof(SmartAquaponic.Domain.Tank.Heigth))%> cm
                    </td>
                    <td>
                        <%#Eval(nameof(SmartAquaponic.Domain.Tank.Length))%> cm
                    </td>
                    <td>
                        <%#Eval(nameof(SmartAquaponic.Domain.Tank.Width))%> cm
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
                            targets: 10
                        },
                        {
                            visible: false,
                            targets: 11
                        },
                        {
                            orderable: false,
                            targets: 12
                        }
                    ]
                });
            }
        });
    </script>
</asp:Content>
