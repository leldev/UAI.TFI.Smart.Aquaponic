<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartAquaponic.Web.User.Default" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>
<%@ Register Src="~/Controls/CircleControl.ascx" TagName="CircleControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblUserTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
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
                                    <asp:Literal ID="LtlLastName" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlUsername" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlEmail" runat="server" />
                                </th>
                                <th scope="col">
                                    <asp:Literal ID="LtlIsLocked" runat="server" />
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
                <tr class="<%#(bool)Eval(nameof(SmartAquaponic.Domain.User.IsDeleted)) ? "item-deleted" : string.Empty %>">
                    <th scope="row">
                        <%#Eval(nameof(SmartAquaponic.Domain.User.Id))%>
                    </th>
                    <td class="font-weight-bold">
                        <%#Eval(nameof(SmartAquaponic.Domain.User.Name))%>
                    </td>
                    <td>
                        <%#Eval(nameof(SmartAquaponic.Domain.User.LastName))%>
                    </td>
                    <td>
                        <%#Eval(nameof(SmartAquaponic.Domain.User.Username))%>
                    </td>
                    <td>
                        <%#Eval(nameof(SmartAquaponic.Domain.User.Email))%>
                    </td>
                    <td class="">
                        <sa:CircleControl ID="CircleControl" runat="server" />
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

                        <asp:HyperLink ID="LnkPassword" runat="server">
                            <i class="fas fa-key green-text"></i>
                        </asp:HyperLink>

                        <asp:HyperLink ID="LnkUnlock" runat="server">
                            <i class="fas fa-unlock-alt"></i>
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
                    dom: 'Bfrtip',
                    select: true,
                    colReorder: true,
                    buttons: [
                        {
                            extend: 'collection',
                            text: 'Export',
                            buttons: [
                                'copy',
                                'excel',
                                'csv',
                                'pdf',
                                'print'
                            ]
                        }
                    ],
                    columnDefs: [
                        {
                            visible: false,
                            targets: 0
                        },
                        {
                            orderable: false,
                            targets: 5
                        },
                        {
                            visible: false,
                            targets: 6
                        },
                        {
                            visible: false,
                            targets: 7
                        },
                        {
                            orderable: false,
                            targets: 8
                        }
                    ]
                });
                $('.dataTables_length').addClass('bs-select');
            }
        });
    </script>
</asp:Content>
