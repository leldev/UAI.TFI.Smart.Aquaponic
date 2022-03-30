<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SmartAquaponic.Web.Pot.Update" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/cube/three.min.js"></script>
    <script src="../Scripts/cube/dat.gui.min.js.js"></script>
    <script src="../Scripts/cube/OrbitControls.js.js"></script>
    <script src="../Scripts/cube/ParametricGeometries.js.js"></script>
    <script src="../Scripts/cube/geometry.js.js"></script>

    <asp:Label ID="LblUpdatePotTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <asp:HiddenField ID="FldModifiedDate" runat="server" />
        <div class="form-row">
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" MaxLength="50" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired" runat="server" />
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblRgb" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtRgb" runat="server" TextMode="Color" CssClass="form-control" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired1" runat="server" />
                </div>
            </div>
            <div class="form-group col-md col-sm-12">
                <asp:Label ID="LblRock" runat="server" CssClass="h4" />
                <asp:DropDownList ID="DdlRock" runat="server" CssClass="browser-default custom-select" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4 col-sm-12">
                <asp:Label ID="LblPlants" runat="server" CssClass="h4" />
                <asp:ListBox ID="DdlPlants" runat="server" CssClass="browser-default custom-select custom-select-multiple" SelectionMode="Multiple" />
            </div>
            <div class="form-group col-md-4 col-sm-12">
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
                <asp:Label ID="LblLength" runat="server" CssClass="h4" />
                15 cm - 100 cm
                <div class="input-group">
                    <asp:TextBox ID="TxtLength" runat="server" TextMode="Number" min="15" max="100" step=".01" CssClass="form-control" required="" />
                    <div class="input-group-prepend">
                        <div class="input-group-text">cm</div>
                    </div>
                    <div class="invalid-feedback">
                        <asp:Label ID="LblRequired3" runat="server" />
                    </div>
                </div>
                <asp:Label ID="LblWidth" runat="server" CssClass="h4" />
                15 cm - 100 cm
                <div class="input-group">
                    <asp:TextBox ID="TxtWidth" runat="server" TextMode="Number" min="15" max="100" step=".01" CssClass="form-control" required="" />
                    <div class="input-group-prepend">
                        <div class="input-group-text">cm</div>
                    </div>
                    <div class="invalid-feedback">
                        <asp:Label ID="LblRequired5" runat="server" />
                    </div>
                </div>
            </div>
            <div class="form-group col-md-4 col-sm-12">
                <div class="scene" style="margin-top: 45px;">
                </div>
            </div>
        </div>
        <div class="form-row">
            <asp:Button ID="BtnUpdate" runat="server" OnClick="BtnUpdate_Click" CssClass="btn blue-gradient" />
        </div>
    </asp:Panel>
    <script type="text/javascript">
        var gui = new dat.GUI();
        var scene = new THREE.Scene();
        var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 50);
        var mesh;
        var renderer;
        var orbit;
        var prevFog = false;
        var options;


        var xId = '#<%= this.TxtLength.ClientID %>';
        var yId = '#<%= this.TxtHeigth.ClientID %>';
        var zId = '#<%= this.TxtWidth.ClientID %>';
        var colorInput = '#<%= this.TxtRgb.ClientID %>';

        var color = document.querySelector(colorInput).value;

        document.querySelector(xId).addEventListener('keyup', () => { sa.util.buildPot() });
        document.querySelector(yId).addEventListener('keyup', () => { sa.util.buildPot() });
        document.querySelector(zId).addEventListener('keyup', () => { sa.util.buildPot() });
        document.querySelector(colorInput).addEventListener('change', (e) => { sa.util.reBuildPor(e) });

        sa.util.buildPot = () => {
            if (mesh) {
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
        }

        sa.util.reBuildPor = (e) => {
            var canvas = document.querySelector('canvas')

            if (canvas) {
                canvas.remove();

                gui = new dat.GUI();
                scene = new THREE.Scene();
                camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 50);
                mesh;
                renderer;
                orbit;
                prevFog = false;
                options;
                color = e.target.value;

                // init
                build();
                render();

                sa.util.buildPot();
            }
        }

        window.location.hash = 'BoxGeometry';

        var build = () => {
            // rotation
            camera.position.z = 30;
            camera.position.y = 15;

            var container = document.querySelector(".scene");
            renderer = new THREE.WebGLRenderer({ antialias: true });
            renderer.setPixelRatio(window.devicePixelRatio);
            renderer.setSize(container.offsetWidth, container.offsetHeight);
            renderer.setClearColor(0xe9ecef, 1);
            container.appendChild(renderer.domElement);

            // move object
            orbit = new THREE.OrbitControls(camera, renderer.domElement);
            orbit.enableZoom = false;
            orbit.enableRotate = true;
            orbit.autoRotate = true;
            orbit.autoRotateSpeed = 1;
            orbit.rotateSpeed = 1;

            var lights = [];
            lights[0] = new THREE.PointLight(color, 1, 0);
            lights[1] = new THREE.PointLight(color, 1, 0);
            lights[2] = new THREE.PointLight(color, 1, 0);

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
                    opacity: 0.3
                })

            ));

            mesh.add(new THREE.Mesh(

                new THREE.Geometry(),

                new THREE.MeshPhongMaterial({
                    color: color,
                    emissive: color,
                    side: THREE.DoubleSide,
                    shading: THREE.FlatShading
                })

            ));

            options = chooseFromHash(mesh);
            scene.add(mesh);
        }

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

        ready(() => {
            sa.util.validateForm();

            // init
            build();
            render();

            // fix tank from postback
            sa.util.buildPot();
        });

        // fix tank from postback
        sa.util.buildPot();
    </script>
</asp:Content>

