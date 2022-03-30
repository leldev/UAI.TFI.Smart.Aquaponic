<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logs.aspx.cs" Inherits="SmartAquaponic.Web.Logs" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>
<%@ Register Src="~/Controls/CircleControl.ascx" TagName="CircleControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblLogsTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <asp:Repeater ID="RptData" runat="server">
            <HeaderTemplate>
                <div class="table-responsive">
                    <table class="table table-hover text-center">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">
                                    <asp:Literal ID="LtlIp" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlMessage" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlEvent" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlUser" runat="server" />
                                </th>
                                <th scope="col" class="d-none d-sm-table-cell">
                                    <asp:Literal ID="LtlCreateDate" runat="server" />
                                </th>
                            </tr>
                        </thead>
                        <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <th scope="row">
                        <%#Eval(nameof(SmartAquaponic.Domain.Log.Id))%>
                    </th>
                    <td>
                        <%#Eval(nameof(SmartAquaponic.Domain.Log.Ip))%>
                    </td>
                    <td>
                        <%#Eval(nameof(SmartAquaponic.Domain.Log.Message))%>
                    </td>
                    <td>
                        <asp:Label ID="LblEvent" runat="server" />
                    </td>
                    <td>
                        <%#Eval(nameof(SmartAquaponic.Domain.Log.User))%>
                    </td>
                    <td class="d-none d-sm-table-cell">
                        <%#Eval(nameof(SmartAquaponic.Domain.Log.CreatedDate))%>
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
    <script type="text/javascript">
        $(document).ready(function () {
            var count = <%= this.RptData.Items == null ? 0 :  this.RptData.Items.Count %>;

            if (count > 0) {
                $('.table').DataTable({
                    columnDefs: [
                        {
                            visible: false,
                            targets: 0
                        },
                        {
                            orderable: false,
                            width: '200px',
                            targets: 1
                        },
                        {
                            orderable: false,
                            width: '200px',
                            targets: 3
                        },
                        {
                            orderable: false,
                            width: '200px',
                            targets: 4
                        }
                    ]
                });
                $('.dataTables_length').addClass('bs-select');
            }
        });  </script>
</asp:Content>
