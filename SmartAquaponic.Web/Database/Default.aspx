<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartAquaponic.Web.Database.Default" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>
<%@ Register Src="~/Controls/CircleControl.ascx" TagName="CircleControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblDatabaseTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <br />
        <div class="row">
            <div class="col-xs-12 col-md-2 text-uppercase">
                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">
                        <asp:Literal ID="LtlVerify" runat="server" />
                    </a>
                    <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                        <asp:Literal ID="LtlBackup" runat="server" />
                    </a>
                    <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                        <asp:Literal ID="LtlRestore" runat="server" />
                    </a>
                </div>
            </div>
            <div class="col-xs-12 col-md-10">
                <div class="tab-content" id="v-pills-tabContent">
                    <%-- Tab 1 --%>
                    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                        <asp:Label ID="LblVerifyIntegrity" runat="server" CssClass="display-4 text-success text-uppercase" />
                        <br />
                        <br />
                        <asp:Button ID="BtnVerify" runat="server" CssClass="btn blue-gradient" OnClick="BtnVerify_Click" />
                        <asp:Button ID="BtnRecovery" runat="server" Visible="false" CssClass="btn aqua-gradient" OnClick="BtnRecovery_Click" />
                        <span class="web-loading">
                            <span class="spinner-grow text-primary" role="status"></span>
                            <span class="spinner-grow text-info" role="status"></span>
                            <span class="spinner-grow text-success" role="status"></span>
                        </span>
                    </div>
                    <%-- Tab 2 --%>
                    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                        <asp:Label ID="LblBackup" runat="server" CssClass="display-4 text-success text-uppercase" />
                        <br />
                        <br />
                        <div class="form-row">
                            <div class="form-group col-sm-12 col-md-6 col-xl-4">
                                <asp:Label ID="LblName" runat="server" CssClass="h4" />
                                <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" MaxLength="50" required="" />
                                <div class="invalid-feedback">
                                    <asp:Label ID="LblRequired" runat="server" />
                                </div>
                            </div>
                            <div class="form-group col-sm-12 col-md-2">
                                <asp:Label ID="LblVolumes" runat="server" CssClass="h4" />
                                <asp:DropDownList ID="DdlVolumes" runat="server" CssClass="browser-default custom-select">
                                    <asp:ListItem Text="1" Value="1" Selected="True" />
                                    <asp:ListItem Text="2" Value="2" />
                                    <asp:ListItem Text="3" Value="3" />
                                    <asp:ListItem Text="5" Value="5" />
                                    <asp:ListItem Text="8" Value="8" />
                                    <asp:ListItem Text="13" Value="13" />
                                    <asp:ListItem Text="20" Value="20" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <asp:Button ID="BtnBackup" runat="server" CssClass="btn blue-gradient" OnClick="BtnBackup_Click" />
                        <span class="web-loading">
                            <span class="spinner-grow text-primary" role="status"></span>
                            <span class="spinner-grow text-info" role="status"></span>
                            <span class="spinner-grow text-success" role="status"></span>
                        </span>
                    </div>
                    <%-- Tab 3 --%>
                    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                        <asp:Label ID="LblRestore" runat="server" CssClass="display-4 text-success text-uppercase" />
                        <br />
                        <br />
                        <div class="form-row">
                            <div class="form-group col-sm-12 col-md-6">
                                <asp:Label ID="LblFiles" runat="server" CssClass="h4" />
                                <asp:DropDownList ID="DdlFiles" runat="server" CssClass="browser-default custom-select" />
                            </div>
                        </div>
                        <asp:Button ID="BtnRestore" runat="server" CssClass="btn blue-gradient" OnClick="BtnRestore_Click" />
                        <span class="web-loading">
                            <span class="spinner-grow text-primary" role="status"></span>
                            <span class="spinner-grow text-info" role="status"></span>
                            <span class="spinner-grow text-success" role="status"></span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <br />
    </asp:Panel>
    <br />
    <script type="text/javascript">
        let restore = "<%= this.BtnRestore.ClientID %>";
        let backup = "<%= this.BtnBackup.ClientID %>";
        let verify = "<%= this.BtnVerify.ClientID %>";
        let recovery = "<%= this.BtnRecovery.ClientID %>";

        ready(() => {
            sa.util.validateForm();

            document.getElementById(restore).addEventListener("click", () => {
                if ($(".web-loading").is(":visible")) {
                    document.getElementById(restore).disabled = true;
                }
                document.getElementById("<%= this.TxtName.ClientID %>").value = '...';
                $(".web-loading").show();
            });

            document.getElementById(backup).addEventListener("click", () => {
                if ($(".web-loading").is(":visible")) {
                    document.getElementById(backup).disabled = true;
                }
                $(".web-loading").show();
            });

            document.getElementById(verify).addEventListener("click", () => {
                if ($(".web-loading").is(":visible")) {
                    document.getElementById(verify).disabled = true;
                } else {
                    document.getElementById("<%= this.TxtName.ClientID %>").value = '...';
                    $(".web-loading").show();
                }
            });

            document.getElementById(recovery).addEventListener("click", () => {
                if ($(".web-loading").is(":visible")) {
                    document.getElementById(recovery).disabled = true;
                } else {
                    document.getElementById("<%= this.TxtName.ClientID %>").value = '...';
                    $(".web-loading").show();
                }
            });
        });
    </script>
</asp:Content>
