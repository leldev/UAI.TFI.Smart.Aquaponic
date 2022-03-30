using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace SmartAquaponic.NetCoreConsole.Migrations
{
    public partial class init : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Checksum",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    Hash = table.Column<int>(nullable: false),
                    Table = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Checksum", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Communication",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    Email = table.Column<string>(nullable: true),
                    IsAnswered = table.Column<bool>(nullable: false),
                    Message = table.Column<string>(nullable: true),
                    Reponse = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Communication", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Pot",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Heigth = table.Column<double>(nullable: false),
                    Length = table.Column<double>(nullable: false),
                    Weight = table.Column<double>(nullable: false),
                    Width = table.Column<double>(nullable: false),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    Rgb = table.Column<string>(nullable: true),
                    Rock = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Pot", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SpotLight",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    Slots = table.Column<int>(nullable: false),
                    Socket = table.Column<int>(nullable: false),
                    Heigth = table.Column<double>(nullable: false),
                    Length = table.Column<double>(nullable: false),
                    Weight = table.Column<double>(nullable: false),
                    Width = table.Column<double>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SpotLight", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "UserPreference",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    DateFormat = table.Column<string>(nullable: true),
                    IsDefault = table.Column<bool>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    TimeZone = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserPreference", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "WaterPump",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WaterPump", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Plant",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    IsHydroponic = table.Column<bool>(nullable: false),
                    IsLowLigth = table.Column<bool>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    PotId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Plant", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Plant_Pot_PotId",
                        column: x => x.PotId,
                        principalTable: "Pot",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Lamp",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    Lumen = table.Column<int>(nullable: false),
                    Power = table.Column<int>(nullable: false),
                    Socket = table.Column<int>(nullable: false),
                    SpotLightId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Lamp", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Lamp_SpotLight_SpotLightId",
                        column: x => x.SpotLightId,
                        principalTable: "SpotLight",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Resource",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    Key = table.Column<string>(nullable: true),
                    Module = table.Column<int>(nullable: false),
                    Value = table.Column<string>(nullable: true),
                    UserPreferenceId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Resource", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Resource_UserPreference_UserPreferenceId",
                        column: x => x.UserPreferenceId,
                        principalTable: "UserPreference",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "User",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    Checksum = table.Column<int>(nullable: false),
                    IsLocked = table.Column<bool>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    LastName = table.Column<string>(nullable: true),
                    Password = table.Column<string>(nullable: true),
                    Username = table.Column<string>(nullable: true),
                    IsAuthenticated = table.Column<bool>(nullable: false),
                    LoginAttemts = table.Column<int>(nullable: false),
                    PreferenceId = table.Column<int>(nullable: true),
                    TempPassword = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_User", x => x.Id);
                    table.ForeignKey(
                        name: "FK_User_UserPreference_PreferenceId",
                        column: x => x.PreferenceId,
                        principalTable: "UserPreference",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Tank",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    PH = table.Column<int>(nullable: false),
                    WaterPumpId = table.Column<int>(nullable: true),
                    WaterTemp = table.Column<double>(nullable: false),
                    Heigth = table.Column<double>(nullable: false),
                    Length = table.Column<double>(nullable: false),
                    Weight = table.Column<double>(nullable: false),
                    Width = table.Column<double>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tank", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Tank_WaterPump_WaterPumpId",
                        column: x => x.WaterPumpId,
                        principalTable: "WaterPump",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Log",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    Hash = table.Column<int>(nullable: false),
                    Event = table.Column<int>(nullable: false),
                    Ip = table.Column<string>(nullable: true),
                    Message = table.Column<string>(nullable: true),
                    UserId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Log", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Log_User_UserId",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Role",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    Discriminator = table.Column<string>(nullable: false),
                    GroupId = table.Column<int>(nullable: true),
                    UserId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Role", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Role_Role_GroupId",
                        column: x => x.GroupId,
                        principalTable: "Role",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Role_User_UserId",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Decor",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    TankId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Decor", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Decor_Tank_TankId",
                        column: x => x.TankId,
                        principalTable: "Tank",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Fish",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    IsLonely = table.Column<bool>(nullable: false),
                    MaxVolume = table.Column<int>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    PH = table.Column<int>(nullable: false),
                    Size = table.Column<double>(nullable: false),
                    Temp = table.Column<double>(nullable: false),
                    FishId = table.Column<int>(nullable: true),
                    TankId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Fish", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Fish_Fish_FishId",
                        column: x => x.FishId,
                        principalTable: "Fish",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Fish_Tank_TankId",
                        column: x => x.TankId,
                        principalTable: "Tank",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Product",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    ModifiedDate = table.Column<DateTime>(nullable: false),
                    Cost = table.Column<double>(nullable: false),
                    Description = table.Column<string>(nullable: true),
                    IsActive = table.Column<bool>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    PotId = table.Column<int>(nullable: true),
                    SpotLightId = table.Column<int>(nullable: true),
                    TankId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Product", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Product_Pot_PotId",
                        column: x => x.PotId,
                        principalTable: "Pot",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Product_SpotLight_SpotLightId",
                        column: x => x.SpotLightId,
                        principalTable: "SpotLight",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Product_Tank_TankId",
                        column: x => x.TankId,
                        principalTable: "Tank",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Decor_TankId",
                table: "Decor",
                column: "TankId");

            migrationBuilder.CreateIndex(
                name: "IX_Fish_FishId",
                table: "Fish",
                column: "FishId");

            migrationBuilder.CreateIndex(
                name: "IX_Fish_TankId",
                table: "Fish",
                column: "TankId");

            migrationBuilder.CreateIndex(
                name: "IX_Lamp_SpotLightId",
                table: "Lamp",
                column: "SpotLightId");

            migrationBuilder.CreateIndex(
                name: "IX_Log_UserId",
                table: "Log",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Plant_PotId",
                table: "Plant",
                column: "PotId");

            migrationBuilder.CreateIndex(
                name: "IX_Product_PotId",
                table: "Product",
                column: "PotId");

            migrationBuilder.CreateIndex(
                name: "IX_Product_SpotLightId",
                table: "Product",
                column: "SpotLightId");

            migrationBuilder.CreateIndex(
                name: "IX_Product_TankId",
                table: "Product",
                column: "TankId");

            migrationBuilder.CreateIndex(
                name: "IX_Resource_UserPreferenceId",
                table: "Resource",
                column: "UserPreferenceId");

            migrationBuilder.CreateIndex(
                name: "IX_Role_GroupId",
                table: "Role",
                column: "GroupId");

            migrationBuilder.CreateIndex(
                name: "IX_Role_UserId",
                table: "Role",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Tank_WaterPumpId",
                table: "Tank",
                column: "WaterPumpId");

            migrationBuilder.CreateIndex(
                name: "IX_User_PreferenceId",
                table: "User",
                column: "PreferenceId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Checksum");

            migrationBuilder.DropTable(
                name: "Communication");

            migrationBuilder.DropTable(
                name: "Decor");

            migrationBuilder.DropTable(
                name: "Fish");

            migrationBuilder.DropTable(
                name: "Lamp");

            migrationBuilder.DropTable(
                name: "Log");

            migrationBuilder.DropTable(
                name: "Plant");

            migrationBuilder.DropTable(
                name: "Product");

            migrationBuilder.DropTable(
                name: "Resource");

            migrationBuilder.DropTable(
                name: "Role");

            migrationBuilder.DropTable(
                name: "Pot");

            migrationBuilder.DropTable(
                name: "SpotLight");

            migrationBuilder.DropTable(
                name: "Tank");

            migrationBuilder.DropTable(
                name: "User");

            migrationBuilder.DropTable(
                name: "WaterPump");

            migrationBuilder.DropTable(
                name: "UserPreference");
        }
    }
}
