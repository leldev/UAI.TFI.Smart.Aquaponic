<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SmartAquaponic.Web.Fish.Create" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>
<%@ Register Src="~/Controls/CircleControl.ascx" TagName="CircleControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblCreateFishTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <div class="form-row">
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" MaxLength="50" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired" runat="server" />
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblSize" runat="server" CssClass="h4" />
                0 cm - 50 cm
                <div class="input-group">
                    <asp:TextBox ID="TxtSize" runat="server" CssClass="form-control" TextMode="Number" min="0" max="50" step=".01" required="" />
                    <div class="input-group-prepend">
                        <div class="input-group-text">cm</div>
                    </div>
                    <div class="invalid-feedback">
                        <asp:Label ID="LblRequired1" runat="server" />
                    </div>
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblTemp" runat="server" CssClass="h4" />
                0 ºC - 40 ºC
                <div class="input-group">
                    <asp:TextBox ID="TxtTemp" runat="server" CssClass="form-control" TextMode="Number" min="0" max="40" step=".01" required="" />
                    <div class="input-group-prepend">
                        <div class="input-group-text">ºC</div>
                    </div>
                    <div class="invalid-feedback">
                        <asp:Label ID="LblRequired2" runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblWaterRequired" runat="server" CssClass="h4" />
                <i class="fas fa-calculator amber-text" onclick="sa.util.calc()"></i>
                <div class="input-group">
                    <asp:TextBox ID="TxtWaterRequired" runat="server" CssClass="form-control" TextMode="Number" min="0" max="1000000" step=".01" required="" />
                    <div class="input-group-prepend">
                        <div class="input-group-text">cm<sup>3</sup></div>
                    </div>
                    <div class="invalid-feedback">
                        <asp:Label ID="LblRequired3" runat="server" />
                    </div>
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblPh" runat="server" CssClass="h4" />
                <sa:CircleControl ID="CircleControl1" runat="server" Checked="true" FullCircle="true" Rgb="#EE3722" TitleTip="1" />
                <sa:CircleControl ID="CircleControl2" runat="server" Checked="true" FullCircle="true" Rgb="#EE3479" TitleTip="2" />
                <sa:CircleControl ID="CircleControl3" runat="server" Checked="true" FullCircle="true" Rgb="#F57E26" TitleTip="3" />
                <sa:CircleControl ID="CircleControl4" runat="server" Checked="true" FullCircle="true" Rgb="#FBA923" TitleTip="4" />
                <sa:CircleControl ID="CircleControl5" runat="server" Checked="true" FullCircle="true" Rgb="#F4EC08" TitleTip="5" />
                <sa:CircleControl ID="CircleControl6" runat="server" Checked="true" FullCircle="true" Rgb="#A3CD39" TitleTip="6" />
                <sa:CircleControl ID="CircleControl7" runat="server" Checked="true" FullCircle="true" Rgb="#4DB847" TitleTip="7" />
                <sa:CircleControl ID="CircleControl8" runat="server" Checked="true" FullCircle="true" Rgb="#019247" TitleTip="8" />
                <sa:CircleControl ID="CircleControl9" runat="server" Checked="true" FullCircle="true" Rgb="#059495" TitleTip="9" />
                <sa:CircleControl ID="CircleControl10" runat="server" Checked="true" FullCircle="true" Rgb="#5175BA" TitleTip="10" />
                <sa:CircleControl ID="CircleControl11" runat="server" Checked="true" FullCircle="true" Rgb="#454A9F" TitleTip="11" />
                <sa:CircleControl ID="CircleControl12" runat="server" Checked="true" FullCircle="true" Rgb="#2A2F84" TitleTip="12" />
                <sa:CircleControl ID="CircleControl13" runat="server" Checked="true" FullCircle="true" Rgb="#94248C" TitleTip="13" />
                <sa:CircleControl ID="CircleControl14" runat="server" Checked="true" FullCircle="true" Rgb="#7B2779" TitleTip="14" />
                <asp:DropDownList ID="DdlPh" runat="server" CssClass="browser-default custom-select" />
            </div>
            <div class="form-group col-md col-12 m-auto">
                <div class="checkbox checkbox-primary h4">
                    <asp:CheckBox ID="CbxIsLonely" runat="server" data-toggle="tooltip" data-html="true" CssClass="btn-link text-primary" AutoPostBack="false" />
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4 col-sm-12">
                <asp:Label ID="LblPredators" runat="server" CssClass="h4" />
                <i class="far fa-plus-square" onclick="sa.util.selectAll(true)"></i>
                <i class="far fa-minus-square" onclick="sa.util.selectAll(false)"></i>
                <asp:ListBox ID="DdlPredators" runat="server" CssClass="browser-default custom-select custom-select-multiple" SelectionMode="Multiple" />
            </div>
        </div>
        <div class="form-row">
            <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" CssClass="btn blue-gradient" />
        </div>
    </asp:Panel>
    <script type="text/javascript">
        ready(() => {
            sa.util.validateForm();

            // select all
            sa.util.selectAll = (value) => {
                var decorsId = '#<%= this.DdlPredators.ClientID %>';
                var selectEle = document.querySelector(decorsId);

                if (selectEle && selectEle.options) {
                    selectEle.options.forEach((option) => {
                        option.selected = value;
                    })
                }
            }

            sa.util.calc = () => {
                var size = '#<%= this.TxtSize.ClientID %>';
                var water = '#<%= this.TxtWaterRequired.ClientID %>';

                var sizeEle = document.querySelector(size);

                if (sizeEle && sizeEle.value) {
                    var waterEle = document.querySelector(water);
                    waterEle.value = sizeEle.value * 1000;
                }
            }
        });
    </script>
</asp:Content>
