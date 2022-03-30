<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartAquaponic.Web.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="display-4 text-success text-uppercase text-center">
            <asp:Literal ID="LtlWhatsAquaponicTitle" runat="server" />
        </div>
        <div class="row">
            <div class="col-md-6 order-md-last view view-cascade m-auto view overlay zoom">
                <img src="Images/logofull.png" class="img-fluid m-auto" />
            </div>
            <div class="col-md-6 text-center font-weight-bold font-italic">
                <div class="list-group-flush">
                    <div class="list-group-item">
                        <p class="mb-0">
                            <i class="fas fa-fish fa-2x p-3 text-primary" aria-hidden="true"></i>
                            <asp:Literal ID="LtlWhatsAquaponicFish" runat="server" />
                        </p>
                    </div>
                    <div class="list-group-item">
                        <p class="mb-0">
                            <i class="fas fa-tint fa-2x p-3 text-primary" aria-hidden="true"></i>
                            <asp:Literal ID="LtlWhatsAquaponicWater" runat="server" />
                        </p>
                    </div>
                    <div class="list-group-item">
                        <p class="mb-0">
                            <i class="fas fa-leaf fa-2x p-3 text-primary" aria-hidden="true"></i>
                            <asp:Literal ID="LtlWhatsAquaponicPlant" runat="server" />
                        </p>
                    </div>
                    <div class="list-group-item">
                        <p class="mb-0">
                            <i class="fas fa-recycle fa-spin fa-2x p-3 text-primary" aria-hidden="true"></i>
                            <asp:Literal ID="LtlWhatsAquaponicRecycle" runat="server" />
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <div class="display-4 text-primary text-uppercase text-center">
            <asp:Literal ID="LtlTransformEnvironmentTitle" runat="server" />
        </div>
        <div class="display-5 text-center font-weight-bold font-italic">
            <asp:Literal ID="LtlTransformEnvironmentDescription1" runat="server" />
        </div>
        <div class="display-5 text-center font-weight-bold font-italic">
            <asp:Literal ID="LtlTransformEnvironmentDescription2" runat="server" />
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="list-group-flush text-center font-weight-bold font-italic">
                    <div class="list-group-item">
                        <i class="fas fa-recycle fa-spin fa-2x p-3 text-success m-auto" aria-hidden="true"></i>
                        <p class="text-success">
                            <asp:Literal ID="LtlTransformEnvironmentNatural" runat="server" />
                        </p>
                        <div>
                            <asp:Literal ID="LtlTransformEnvironmentNaturalDescription1" runat="server" />
                        </div>
                        <div>
                            <asp:Literal ID="LtlTransformEnvironmentNaturalDescription2" runat="server" />
                        </div>
                    </div>
                    <div class="list-group-item">
                        <i class="fas fa-heart fa-2x p-3 text-success m-auto" aria-hidden="true"></i>
                        <p class="text-success">
                            <asp:Literal ID="LtlTransformEnvironmentBeatiful" runat="server" />
                        </p>
                        <div>
                            <asp:Literal ID="LtlTransformEnvironmentBeatifulDescription1" runat="server" />
                        </div>
                        <div>
                            <asp:Literal ID="LtlTransformEnvironmentBeatifulDescription2" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 text-center">
                <div class="view view-cascade m-auto view overlay zoom">
                    <img src="Images/product.png" class="img-fluid m-auto" />
                </div>
            </div>
            <div class="col-md-4">
                <div class="list-group-flush text-center font-weight-bold font-italic">
                    <div class="list-group-item">
                        <i class="fas fa-graduation-cap fa-2x p-3 text-success m-auto" aria-hidden="true"></i>
                        <p class="text-success">
                            <asp:Literal ID="LtlTransformEnvironmentEducationalTitle" runat="server" />
                        </p>
                        <div>
                            <asp:Literal ID="LtlTransformEnvironmentEducationalDescription1" runat="server" />
                        </div>
                        <div>
                            <asp:Literal ID="LtlTransformEnvironmentEducationalDescription2" runat="server" />
                        </div>
                    </div>
                    <div class="list-group-item">
                        <i class="fas fa-cogs fa-2x p-3 text-success m-auto" aria-hidden="true"></i>
                        <p class="text-success">
                            <asp:Literal ID="LtlTransformEnvironmentFunctionalTitle" runat="server" />
                        </p>
                        <div>
                            <asp:Literal ID="LtlTransformEnvironmentFunctionalDescription1" runat="server" />
                        </div>
                        <div>
                            <asp:Literal ID="LtlTransformEnvironmentFunctionalDescription2" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#animateLogo").show();
            $("#animateLogo").css('position', 'fixed');
            animateLogo("#animateLogo");
        });

        function makeNewPosition() {
            // Get viewport dimensions (remove the dimension of the div)
            var h = $(window).height() - 50;
            var w = $(window).width() - 50;

            var nh = Math.floor(Math.random() * h);
            var nw = Math.floor(Math.random() * w);

            return [nh, nw];

        }

        function animateLogo(id) {
            var newq = makeNewPosition();
            var oldq = $(id).offset();
            var speed = calcSpeed([oldq.top, oldq.left], newq);

            $(id).animate({ top: newq[0], left: newq[1] }, speed, () => {
                animateLogo(id);
            });

        };

        function calcSpeed(prev, next) {
            var x = Math.abs(prev[1] - next[1]);
            var y = Math.abs(prev[0] - next[0]);

            var greatest = x > y ? x : y;

            var speedModifier = 0.1;

            var speed = Math.ceil(greatest / speedModifier);

            return speed;

        }
    </script>
</asp:Content>
