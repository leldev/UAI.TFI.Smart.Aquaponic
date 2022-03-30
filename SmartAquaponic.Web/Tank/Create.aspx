<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SmartAquaponic.Web.Tank.Create" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>
<%@ Register Src="~/Controls/CircleControl.ascx" TagName="CircleControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/cube/three.min.js"></script>
    <script src="../Scripts/cube/dat.gui.min.js.js"></script>
    <script src="../Scripts/cube/OrbitControls.js.js"></script>
    <script src="../Scripts/cube/ParametricGeometries.js.js"></script>
    <script src="../Scripts/cube/geometry.js.js"></script>

    <asp:Label ID="LblCreateTankTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <asp:HiddenField ID="FldFishes" runat="server" />
        <asp:HiddenField ID="FldDecors" runat="server" />
        <asp:HiddenField ID="FldWaterPumps" runat="server" />
        <div class="form-row">
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" MaxLength="50" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired" runat="server" />
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblWaterTemp" runat="server" CssClass="h4" />
                0 ºC - 40 ºC
                <div class="input-group">
                    <asp:TextBox ID="TxtWaterTemp" runat="server" CssClass="form-control" TextMode="Number" min="0" max="40" step=".01" required="" />
                    <div class="input-group-prepend">
                        <div class="input-group-text">ºC</div>
                    </div>
                    <div class="invalid-feedback">
                        <asp:Label ID="LblRequired1" runat="server" />
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
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblWaterPump" runat="server" CssClass="h4" />
                <asp:DropDownList ID="DdlWaterPump" runat="server" CssClass="browser-default custom-select" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblDecors" runat="server" CssClass="h4" />
                <i class="far fa-plus-square" onclick="sa.util.selectAll(true)"></i>
                <i class="far fa-minus-square" onclick="sa.util.selectAll(false)"></i>
                <asp:ListBox ID="DdlDecors" runat="server" CssClass="browser-default custom-select custom-select-multiple" SelectionMode="Multiple" />
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblFishes" runat="server" CssClass="h4" />
                <asp:Repeater ID="RptData" runat="server">
                    <HeaderTemplate>
                        <div class="table-responsive fish-table">
                            <table class="table table-hover table-sm">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">
                                            <asp:Literal ID="LtlName" runat="server" />
                                        </th>
                                        <th scope="col">
                                            <asp:Literal ID="LtlCant" runat="server" />
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="fishes">
                            <td>
                                <div class="checkbox checkbox-primary">
                                    <asp:CheckBox ID="CbxFish" runat="server" CssClass="fish-cbx" data-toggle="tooltip" data-html="true" />
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <asp:HiddenField ID="FldId" runat="server" />
                                    <asp:TextBox ID="TxtCant" runat="server" CssClass="form-control fish-txt" TextMode="Number" min="0" max="50" required="" />
                                </div>
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
            <div class="form-group col-md col-sm-12">
                <div class="form-group">
                    <asp:Label ID="LblHeigth" runat="server" CssClass="h4" />
                    15 cm - 100 cm
                    <div class="input-group">
                        <asp:TextBox ID="TxtHeigth" runat="server" TextMode="Number" min="15" max="100" step=".01" CssClass="form-control" required="" />
                        <div class="input-group-prepend">
                            <div class="input-group-text">cm</div>
                        </div>
                        <div class="invalid-feedback">
                            <asp:Label ID="LblRequired2" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblLength" runat="server" CssClass="h4" Style="z-index: 9999" />
                    15 cm - 100 cm
                    <div class="input-group">
                        <asp:TextBox ID="TxtLength" runat="server" TextMode="Number" min="15" max="100" step=".01" CssClass="form-control" required="" Style="z-index: 9999" />
                        <div class="input-group-prepend">
                            <div class="input-group-text" style="z-index: 9999">cm</div>
                        </div>
                        <div class="invalid-feedback">
                            <asp:Label ID="LblRequired3" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblWidth" runat="server" CssClass="h4" Style="z-index: 9999" />
                    15 cm - 100 cm
                    <div class="input-group">
                        <asp:TextBox ID="TxtWidth" runat="server" TextMode="Number" min="15" max="100" step=".01" CssClass="form-control" required="" Style="z-index: 9999" />
                        <div class="input-group-prepend">
                            <div class="input-group-text" style="z-index: 9999">cm</div>
                        </div>
                        <div class="invalid-feedback">
                            <asp:Label ID="LblRequired5" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="scene">
                </div>
            </div>
        </div>
        <div class="form-row">
            <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" CssClass="btn blue-gradient" />
        </div>
    </asp:Panel>
    <script type="text/javascript">
        var gui = new dat.GUI();
        var scene = new THREE.Scene();
        var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 50);
        var mesh;

        ready(() => {
            sa.util.validateForm();

            // fish cant
            let elems = document.querySelectorAll(".fish-cbx");
            elems.forEach((elem) => {
                elem.addEventListener("change", (e) => {
                    let input = e.target.closest(".fishes").querySelector(".fish-txt");

                    if (e.target.checked) {
                        input.required = true;
                        input.disabled = false;
                        input.readOnly = false;
                    } else {
                        input.required = false;
                        input.disabled = true;
                        input.readOnly = true;
                        input.value = '';
                    }
                });
            });

            // select all
            sa.util.selectAll = (value) => {
                var decorsId = '#<%= this.DdlDecors.ClientID %>';
                var selectEle = document.querySelector(decorsId);

                if (selectEle && selectEle.options) {
                    selectEle.options.forEach((option) => {
                        option.selected = value;
                    })
                }
            }

            ///////////////// cube /////////////////

            var xId = '#<%= this.TxtLength.ClientID %>';
            var yId = '#<%= this.TxtHeigth.ClientID %>';
            var zId = '#<%= this.TxtWidth.ClientID %>';

            document.querySelector(xId).addEventListener('keyup', () => { sa.util.buildTank() });
            document.querySelector(yId).addEventListener('keyup', () => { sa.util.buildTank() });
            document.querySelector(zId).addEventListener('keyup', () => { sa.util.buildTank() });

            sa.util.buildTank = () => {
                var x = document.querySelector(xId).value;
                var y = document.querySelector(yId).value;
                var z = document.querySelector(zId).value;

                var min = 15;
                var max = 100;

                if (x && y && z && (x >= min && x <= max) && (y >= min && y <= max) && (z >= min && z <= max)) {
                    mesh.scale.x = getScale(x);
                    mesh.scale.z = getScale(z);
                    mesh.scale.y = getScale(y);

                    mesh.visible = true;
                } else {
                    mesh.visible = false;
                }
            }

            window.location.hash = 'BoxGeometry';

            // rotation
            camera.position.z = 30;
            camera.position.y = 15;

            var container = document.querySelector(".scene");
            var renderer = new THREE.WebGLRenderer({ antialias: true });
            renderer.setPixelRatio(window.devicePixelRatio);
            renderer.setSize(container.offsetWidth, container.offsetHeight);
            renderer.setClearColor(0xe9ecef, 1);
            container.appendChild(renderer.domElement);

            // move object
            var orbit = new THREE.OrbitControls(camera, renderer.domElement);
            orbit.enableZoom = false;
            orbit.enableRotate = true;
            orbit.autoRotate = true;
            orbit.autoRotateSpeed = 1;
            orbit.rotateSpeed = 1;

            var lights = [];
            lights[0] = new THREE.PointLight(0x00FFFF, 1, 0);
            lights[1] = new THREE.PointLight(0x00FFFF, 1, 0);
            lights[2] = new THREE.PointLight(0x00FFFF, 1, 0);

            lights[0].position.set(0, 200, 0);
            lights[1].position.set(100, 200, 100);
            lights[2].position.set(- 100, - 200, - 100);

            scene.add(lights[0]);
            scene.add(lights[1]);
            scene.add(lights[2]);


            mesh = new THREE.Object3D();

            // modified scale x z y - 1.5 max
            mesh.scale.x = 1.5;
            mesh.scale.z = 1.5;
            mesh.scale.y = 1.5;

            // load dont show
            mesh.visible = false;

            mesh.add(new THREE.LineSegments(

                new THREE.Geometry(),

                new THREE.LineBasicMaterial({
                    color: 0xffffff,
                    transparent: true,
                    opacity: 0.1
                })

            ));

            mesh.add(new THREE.Mesh(

                new THREE.Geometry(),

                new THREE.MeshPhongMaterial({
                    color: 0x156289,
                    emissive: 0x072534,
                    side: THREE.DoubleSide,
                    shading: THREE.FlatShading
                })

            ));

            var options = chooseFromHash(mesh);

            scene.add(mesh);

            var prevFog = false;

            var render = () => {

                requestAnimationFrame(render);

                if (!options.fixed) {
                    // mesh.rotation.x += 0.005;
                    mesh.rotation.y += 0.005;
                }

                renderer.render(scene, camera);

            };

            const getScale = (x) => {
                const m = 750 * 0.00001;
                const b = 0.75;

                return result = m * x + b;
            }

            // init
            render();

            // fix tank from postback
            sa.util.buildTank();
        });
    </script>
</asp:Content>
