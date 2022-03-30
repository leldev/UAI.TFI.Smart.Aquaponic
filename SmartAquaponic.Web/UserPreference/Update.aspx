<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SmartAquaponic.Web.UserPreference.Update" Async="true" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblUpdateUserPreferenceTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <div class="form-row">
            <asp:HiddenField ID="FldIgnoreValidation" runat="server" />
            <asp:HiddenField ID="FldModifiedDate" runat="server" />
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" MaxLength="50" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired" runat="server" />
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblDateFormat" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtDateFormat" runat="server" CssClass="form-control" MaxLength="50" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired1" runat="server" />
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblTimeZone" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtTimeZone" runat="server" CssClass="form-control" MaxLength="50" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired2" runat="server" />
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-sm-12 col-lg-8">
                <asp:Label ID="LblResources" runat="server" CssClass="h4" />
                <i class="fas fa-language" onclick="sa.util.openModal()"></i>
                <asp:Label ID="LblTranslate" runat="server" CssClass="btn-link text-primary" onclick="sa.util.openModal()" />
                <asp:Repeater ID="RptData" runat="server">
                    <HeaderTemplate>
                        <div class="table-responsive">
                            <table class="table table-hover text-center table-sm">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">
                                            <asp:Literal ID="LtlKey" runat="server" />
                                        </th>
                                        <th scope="col">
                                            <asp:Literal ID="LtlValue" runat="server" />
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <th scope="row">
                                <%#Eval(nameof(SmartAquaponic.Common.Interfaces.IEntity.Id))%>
                            </th>
                            <td class="font-weight-bold">
                                <%#Eval(nameof(SmartAquaponic.Domain.Resource.Key))%>
                            </td>
                            <td>
                                <asp:HiddenField ID="FldId" runat="server" />
                                <asp:HiddenField ID="FldKey" runat="server" />
                                <asp:HiddenField ID="FldValue" runat="server" />
                                <asp:TextBox ID="TxtValue" runat="server" CssClass="form-control" required="" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                            </table>
                            </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="modal fade" id="translate-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title w-100" id="myModalLabel">
                            <i class="fas fa-language fa-2x"></i>
                            <i class="fas fa-globe fa-2x"></i>
                            <i class="fas fa-language fa-flip-horizontal fa-2x"></i>
                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:DropDownList ID="DdlLanguage" runat="server" CssClass="browser-default custom-select" />
                    </div>
                    <div class="modal-footer">
                        <span class="web-loading">
                            <span class="spinner-grow text-primary" role="status"></span>
                            <span class="spinner-grow text-info" role="status"></span>
                            <span class="spinner-grow text-success" role="status"></span>
                        </span>
                        <asp:Button ID="BtnTranslate" runat="server" OnClick="BtnTranslate_Click" CssClass="btn blue-gradient" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <asp:Button ID="BtnUpdate" runat="server" OnClick="BtnUpdate_Click" CssClass="btn blue-gradient" />
        </div>
    </asp:Panel>
    <script type="text/javascript">
        ready(() => {
            sa.util.validateForm();

            let translate = "<%= this.BtnTranslate.ClientID %>";

            document.getElementById(translate).addEventListener("click", () => {
                if ($(".web-loading").is(":visible")) {
                    document.getElementById(translate).disabled = true;
                }

                $(".web-loading").show();
            });

            sa.util.openModal = () => {
                $('#translate-modal').modal();
            }
        });
    </script>
</asp:Content>
