<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="SmartAquaponic.Web.Product.Create" %>

<%@ Register Src="~/Controls/AlertControl.ascx" TagName="AlertControl" TagPrefix="sa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/cube/three.min.js"></script>
    <script src="../Scripts/cube/dat.gui.min.js.js"></script>
    <script src="../Scripts/cube/OrbitControls.js.js"></script>
    <script src="../Scripts/cube/ParametricGeometries.js.js"></script>
    <script src="../Scripts/cube/geometry.js.js"></script>

    <asp:Label ID="LblCreateProductTitle" runat="server" CssClass="display-4 text-success text-uppercase" />
    <sa:AlertControl ID="AlertControl" runat="server" Visible="false" />
    <asp:Panel ID="PnlMain" runat="server" CssClass="jumbotron">
        <asp:HiddenField ID="FldTank" runat="server" />
        <asp:HiddenField ID="FldPot" runat="server" />
        <asp:HiddenField ID="FldSpotLight" runat="server" />
        <div class="form-row">
            <div class="form-group col-md-4 col-sm-12">
                <asp:Label ID="LblName" runat="server" CssClass="h4" />
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" MaxLength="50" required="" />
                <div class="invalid-feedback">
                    <asp:Label ID="LblRequired" runat="server" />
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4 col-sm-12">
                <asp:Label ID="LblTank" runat="server" CssClass="h4" />
                <asp:DropDownList ID="DdlTank" runat="server" CssClass="browser-default custom-select" required="" />
            </div>
            <div class="form-group col-md-4 col-sm-12">
                <asp:Label ID="LblPot" runat="server" CssClass="h4" />
                <asp:DropDownList ID="DdlPot" runat="server" CssClass="browser-default custom-select" required="" />
            </div>
            <div class="form-group col-md-4 col-sm-12">
                <asp:Label ID="LblSpotLight" runat="server" CssClass="h4" />
                <asp:DropDownList ID="DdlSpotLight" runat="server" CssClass="browser-default custom-select" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4 col-sm-12">
                <div class="scene tankScene" style="margin-top: 50px;">
                </div>
            </div>
            <div class="form-group col-md-4 col-sm-12">
                <div class="scene potScene" style="margin-top: 50px;">
                </div>
            </div>
            <div class="form-group col-md-4 col-sm-12">
                <div class="water-warning" style="display: none">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <asp:Literal ID="LtlHydroponicWarning" Text="Agua" runat="server" />
                    </div>
                </div>
                <div class="light-warning" style="display: none">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <asp:Literal ID="LtlLightWarning" Text="Sol" runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <asp:Button ID="BtnCreate" runat="server" OnClick="BtnCreate_Click" CssClass="btn blue-gradient" />
        </div>
    </asp:Panel>
    <script type="text/javascript">
        var gui1 = new dat.GUI();
        var gui = new dat.GUI();
        // pot
        var scene1 = new THREE.Scene();
        var camera1 = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 50);
        var mesh1;
        var renderer1;
        var orbit1;
        var prevFog = false;
        var options1;
        var color = '';

        var potId = '#<%= this.DdlPot.ClientID %>';
        var tankId = '#<%= this.DdlTank.ClientID %>';
        var pots = JSON.parse(document.querySelector('#<%= this.FldPot.ClientID %>').value);
        var tanks = JSON.parse(document.querySelector('#<%= this.FldTank.ClientID %>').value);

        document.querySelector(potId).addEventListener('change', (e) => { sa.util.reBuildPot(e), sa.util.validatePot() });
        document.querySelector(tankId).addEventListener('change', (e) => { sa.util.reBuildTank(e) });

        // tank
        var scene = new THREE.Scene();
        var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 50);
        var mesh;
        var renderer;
        var orbit;
        var options;

        sa.util.validatePot = () => {
            var pot = pots.find(x => x.Id == document.querySelector(potId).value);

            var someWater = pot.Plants?.some((p) => !p.IsHydroponic);
            var someLight = pot.Plants?.some((p) => !p.IsLowLight);

            var waterEle = document.querySelector('.water-warning');
            waterEle.style.display = someWater ? 'block' : 'none';

            var lightEle = document.querySelector('.light-warning');
            lightEle.style.display = someLight ? 'block' : 'none';
        }

        sa.util.buildPot = () => {

            if (mesh1) {
                mesh1.visible = false;

                var pot = pots.find(x => x.Id == document.querySelector(potId).value);

                if (pot) {
                    color = pot.Rgb;

                    mesh1.scale.x = getScale(pot.Length);
                    mesh1.scale.z = getScale(pot.Width);
                    mesh1.scale.y = getScale(pot.Heigth);

                    mesh1.visible = true;
                }
            }
        }

        sa.util.buildTank = () => {

            if (mesh) {
                mesh.visible = false;

                var tank = tanks.find(x => x.Id == document.querySelector(tankId).value);

                if (tank) {
                    mesh.scale.x = getScale(tank.Length);
                    mesh.scale.z = getScale(tank.Width);
                    mesh.scale.y = getScale(tank.Heigth);

                    mesh.visible = true;
                }
            }
        }

        sa.util.reBuildPot = (e) => {
            var canvas = document.querySelector('.potScene').querySelector('canvas')

            if (canvas) {
                canvas.remove();
            }

            var pot = pots.find(x => x.Id == document.querySelector(potId).value);

            if (pot) {
                gui1 = new dat.GUI();
                scene1 = new THREE.Scene();
                camera1 = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 50);
                mesh1;
                renderer1;
                orbit1;
                prevFog = false;
                options1;
                color = pot.Rgb;

                // init
                build1();
                render1();

                sa.util.buildPot();
            }
        }

        sa.util.reBuildTank = (e) => {
            var canvas = document.querySelector('.tankScene').querySelector('canvas')

            if (canvas) {
                canvas.remove();
            }

            var tank = tanks.find(x => x.Id == document.querySelector(tankId).value);

            if (tank) {
                gui = new dat.GUI();
                scene = new THREE.Scene();
                camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 50);
                mesh;
                renderer;
                orbit;
                prevFog = false;
                options;

                // init
                build();
                render();

                sa.util.buildTank();
            }
        }

        window.location.hash = 'BoxGeometry';

        var build1 = () => {
            var pot = pots.find(x => x.Id == document.querySelector(potId).value);

            if (pot) {
                color = pot.Rgb;
            }

            // rotation
            camera1.position.z = 30;
            camera1.position.y = 15;

            var container = document.querySelector(".potScene");
            renderer1 = new THREE.WebGLRenderer({ antialias: true });
            renderer1.setPixelRatio(window.devicePixelRatio);
            renderer1.setSize(container.offsetWidth, container.offsetHeight);
            renderer1.setClearColor(0xe9ecef, 1);
            container.appendChild(renderer1.domElement);

            // move object
            orbit1 = new THREE.OrbitControls(camera1, renderer1.domElement);
            orbit1.enableZoom = false;
            orbit1.enableRotate = true;
            orbit1.autoRotate = true;
            orbit1.autoRotateSpeed = 1;
            orbit1.rotateSpeed = 1;

            var lights = [];
            lights[0] = new THREE.PointLight(color, 1, 0);
            lights[1] = new THREE.PointLight(color, 1, 0);
            lights[2] = new THREE.PointLight(color, 1, 0);

            lights[0].position.set(0, 200, 0);
            lights[1].position.set(100, 200, 100);
            lights[2].position.set(- 100, - 200, - 100);

            scene1.add(lights[0]);
            scene1.add(lights[1]);
            scene1.add(lights[2]);


            mesh1 = new THREE.Object3D();

            // modified scale x z y - 1.5 max
            mesh1.scale.x = 1.5;
            mesh1.scale.z = 1.5;
            mesh1.scale.y = 1.5;

            // load dont show
            mesh1.visible = false;

            mesh1.add(new THREE.LineSegments(

                new THREE.Geometry(),

                new THREE.LineBasicMaterial({
                    color: 0xffffff,
                    transparent: true,
                    opacity: 0.3
                })

            ));

            mesh1.add(new THREE.Mesh(

                new THREE.Geometry(),

                new THREE.MeshPhongMaterial({
                    color: color,
                    emissive: color,
                    side: THREE.DoubleSide,
                    shading: THREE.FlatShading
                })

            ));

            options1 = chooseFromHash(mesh1, gui1);
            scene1.add(mesh1);
        }

        var render1 = () => {

            requestAnimationFrame(render1);

            if (!options1.fixed) {
                mesh1.rotation.y += 0.005;
            }

            renderer1.render(scene1, camera1);

        };

        var build = () => {
            // rotation
            camera.position.z = 30;
            camera.position.y = 15;

            var container = document.querySelector(".tankScene");
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

            options = chooseFromHash(mesh);

            scene.add(mesh);
        }

        var render = () => {

            requestAnimationFrame(render);

            if (!options.fixed) {
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
            build1();
            render1();

            build();
            render();

            // fix tank from postback
            sa.util.buildPot();
            sa.util.buildTank();
            sa.util.validatePot();
        });

        // fix tank from postback
        sa.util.buildPot();
        sa.util.buildTank();
        sa.util.validatePot();
    </script>
</asp:Content>
