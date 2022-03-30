// --------------------------------------------------------------------
// <copyright file="DataAccessConstant.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Common.Constants
{
    /// <summary>
    /// DataAccessConstant.
    /// </summary>
    public static class DataAccessConstant
    {
        /// <summary>
        /// StoredProcedures.
        /// </summary>
        public sealed class StoredProcedures
        {
            /// <summary>
            /// CreateGroup.
            /// </summary>
            public const string CreateGroup = "USP_CreateGroup";

            /// <summary>
            /// DeleteGroup.
            /// </summary>
            public const string DeleteGroup = "USP_DeleteGroup";

            /// <summary>
            /// GetGroup.
            /// </summary>
            public const string GetGroup = "USP_GetGroup";

            /// <summary>
            /// GetGroups.
            /// </summary>
            public const string GetGroups = "USP_GetGroups";

            /// <summary>
            /// GetRoles.
            /// </summary>
            public const string GetRoles = "USP_GetRoles";

            /// <summary>
            /// UpdateGroup.
            /// </summary>
            public const string UpdateGroup = "USP_UpdateGroup";

            /// <summary>
            /// GetUserPreferences.
            /// </summary>
            public const string GetUserPreferences = "USP_GetUserPreferences";

            /// <summary>
            /// GetUserPreference.
            /// </summary>
            public const string GetUserPreference = "USP_GetUserPreference";

            /// <summary>
            /// UpdateUserPreference.
            /// </summary>
            public const string UpdateUserPreference = "USP_UpdateUserPreference";

            /// <summary>
            /// DeleteUserPreference.
            /// </summary>
            public const string DeleteUserPreference = "USP_DeleteUserPreference";

            /// <summary>
            /// CreateUserPreference.
            /// </summary>
            public const string CreateUserPreference = "USP_CreateUserPreference";

            /// <summary>
            /// GetUsers.
            /// </summary>
            public const string GetUsers = "USP_GetUsers";

            /// <summary>
            /// GetUser.
            /// </summary>
            public const string GetUser = "USP_GetUser";

            /// <summary>
            /// UpdateUser.
            /// </summary>
            public const string UpdateUser = "USP_UpdateUser";

            /// <summary>
            /// UpdateLoginAttempts.
            /// </summary>
            public const string UpdateLoginAttempts = "USP_UpdateLoginAttempts";

            /// <summary>
            /// DeleteUser.
            /// </summary>
            public const string DeleteUser = "USP_DeleteUser";

            /// <summary>
            /// CreateUser.
            /// </summary>
            public const string CreateUser = "USP_CreateUser";

            /// <summary>
            /// Login.
            /// </summary>
            public const string Login = "USP_Login";

            /// <summary>
            /// CreateLog.
            /// </summary>
            public const string CreateLog = "USP_CreateLog";

            /// <summary>
            /// GetLogs.
            /// </summary>
            public const string GetLogs = "USP_GetLogs";

            /// <summary>
            /// ChecksumLog.
            /// </summary>
            public const string ChecksumLog = "USP_ChecksumLog";

            /// <summary>
            /// ChecksumUser.
            /// </summary>
            public const string ChecksumUser = "USP_ChecksumUser";

            /// <summary>
            /// UnlockUser.
            /// </summary>
            public const string UnlockUser = "USP_UnlockUser";

            /// <summary>
            /// RecoveryUser.
            /// </summary>
            public const string RecoveryUser = "USP_RecoveryUser";

            /// <summary>
            /// Backup.
            /// </summary>
            public const string Backup = "USP_Backup";

            /// <summary>
            /// Restore.
            /// </summary>
            public const string Restore = "USP_Restore";

            /// <summary>
            /// GetChecksum.
            /// </summary>
            public const string GetChecksum = "USP_GetChecksum";

            /// <summary>
            /// RecoveryPassword.
            /// </summary>
            public const string RecoveryPassword = "USP_RecoveryPassword";

            /// <summary>
            /// CreateCommunication.
            /// </summary>
            public const string CreateCommunication = "USP_CreateCommunication";

            /// <summary>
            /// UpdateCommunication.
            /// </summary>
            public const string UpdateCommunication = "USP_UpdateCommunication";

            /// <summary>
            /// GetCommunication.
            /// </summary>
            public const string GetCommunication = "USP_GetCommunication";

            /// <summary>
            /// GetCommunications.
            /// </summary>
            public const string GetCommunications = "USP_GetCommunications";

            /// <summary>
            /// ResetPassword.
            /// </summary>
            public const string ResetPassword = "USP_ResetPassword";

            /// <summary>
            /// CreateDecor.
            /// </summary>
            public const string CreateDecor = "USP_CreateDecor";

            /// <summary>
            /// DeleteDecor.
            /// </summary>
            public const string DeleteDecor = "USP_DeleteDecor";

            /// <summary>
            /// GetDecor.
            /// </summary>
            public const string GetDecor = "USP_GetDecor";

            /// <summary>
            /// GetDecor.
            /// </summary>
            public const string GetDecors = "USP_GetDecors";

            /// <summary>
            /// UpdateDecor.
            /// </summary>
            public const string UpdateDecor = "USP_UpdateDecor";

            /// <summary>
            /// CreateLamp.
            /// </summary>
            public const string CreateLamp = "USP_CreateLamp";

            /// <summary>
            /// DeleteLamp.
            /// </summary>
            public const string DeleteLamp = "USP_DeleteLamp";

            /// <summary>
            /// GetLamp.
            /// </summary>
            public const string GetLamp = "USP_GetLamp";

            /// <summary>
            /// GetLamp.
            /// </summary>
            public const string GetLamps = "USP_GetLamps";

            /// <summary>
            /// UpdateLamp.
            /// </summary>
            public const string UpdateLamp = "USP_UpdateLamp";

            /// <summary>
            /// CreatePlant.
            /// </summary>
            public const string CreatePlant = "USP_CreatePlant";

            /// <summary>
            /// DeletePlant.
            /// </summary>
            public const string DeletePlant = "USP_DeletePlant";

            /// <summary>
            /// GetPlant.
            /// </summary>
            public const string GetPlant = "USP_GetPlant";

            /// <summary>
            /// GetPlant.
            /// </summary>
            public const string GetPlants = "USP_GetPlants";

            /// <summary>
            /// UpdatePlant.
            /// </summary>
            public const string UpdatePlant = "USP_UpdatePlant";

            /// <summary>
            /// CreateWaterPump.
            /// </summary>
            public const string CreateWaterPump = "USP_CreateWaterPump";

            /// <summary>
            /// DeleteWaterPump.
            /// </summary>
            public const string DeleteWaterPump = "USP_DeleteWaterPump";

            /// <summary>
            /// GetWaterPump.
            /// </summary>
            public const string GetWaterPump = "USP_GetWaterPump";

            /// <summary>
            /// GetWaterPump.
            /// </summary>
            public const string GetWaterPumps = "USP_GetWaterPumps";

            /// <summary>
            /// UpdateWaterPump.
            /// </summary>
            public const string UpdateWaterPump = "USP_UpdateWaterPump";

            /// <summary>
            /// CreateFish.
            /// </summary>
            public const string CreateFish = "USP_CreateFish";

            /// <summary>
            /// DeleteFish.
            /// </summary>
            public const string DeleteFish = "USP_DeleteFish";

            /// <summary>
            /// GetFish.
            /// </summary>
            public const string GetFish = "USP_GetFish";

            /// <summary>
            /// GetFishes.
            /// </summary>
            public const string GetFishes = "USP_GetFishes";

            /// <summary>
            /// UpdateFish.
            /// </summary>
            public const string UpdateFish = "USP_UpdateFish";

            /// <summary>
            /// CreatePot.
            /// </summary>
            public const string CreatePot = "USP_CreatePot";

            /// <summary>
            /// DeletePot.
            /// </summary>
            public const string DeletePot = "USP_DeletePot";

            /// <summary>
            /// GetPot.
            /// </summary>
            public const string GetPot = "USP_GetPot";

            /// <summary>
            /// GetPots.
            /// </summary>
            public const string GetPots = "USP_GetPots";

            /// <summary>
            /// UpdatePot.
            /// </summary>
            public const string UpdatePot = "USP_UpdatePot";

            /// <summary>
            /// CreateSpotLight.
            /// </summary>
            public const string CreateSpotLight = "USP_CreateSpotLight";

            /// <summary>
            /// DeleteSpotLight.
            /// </summary>
            public const string DeleteSpotLight = "USP_DeleteSpotLight";

            /// <summary>
            /// GetSpotLight.
            /// </summary>
            public const string GetSpotLight = "USP_GetSpotLight";

            /// <summary>
            /// GetSpotLights.
            /// </summary>
            public const string GetSpotLights = "USP_GetSpotLights";

            /// <summary>
            /// UpdateSpotLight.
            /// </summary>
            public const string UpdateSpotLight = "USP_UpdateSpotLight";

            /// <summary>
            /// CreateTank.
            /// </summary>
            public const string CreateTank = "USP_CreateTank";

            /// <summary>
            /// DeleteTank.
            /// </summary>
            public const string DeleteTank = "USP_DeleteTank";

            /// <summary>
            /// GetTank.
            /// </summary>
            public const string GetTank = "USP_GetTank";

            /// <summary>
            /// GetTanks.
            /// </summary>
            public const string GetTanks = "USP_GetTanks";

            /// <summary>
            /// UpdateTank.
            /// </summary>
            public const string UpdateTank = "USP_UpdateTank";

            /// <summary>
            /// CreateProduct.
            /// </summary>
            public const string CreateProduct = "USP_CreateProduct";

            /// <summary>
            /// DeleteProduct.
            /// </summary>
            public const string DeleteProduct = "USP_DeleteProduct";

            /// <summary>
            /// GetProduct.
            /// </summary>
            public const string GetProduct = "USP_GetProduct";

            /// <summary>
            /// GetProducts.
            /// </summary>
            public const string GetProducts = "USP_GetProducts";

            /// <summary>
            /// UpdateProduct.
            /// </summary>
            public const string UpdateProduct = "USP_UpdateProduct";

            /// <summary>
            /// ReportNotUsed.
            /// </summary>
            public const string ReportNotUsed = "USP_ReportNotUsed";

            /// <summary>
            /// ReportMostUsed.
            /// </summary>
            public const string ReportMostUsed = "USP_ReportMostUsed";

        }

        /// <summary>
        /// Columns.
        /// </summary>
        public sealed class Columns
        {
            /// <summary>
            /// GroupId.
            /// </summary>
            public const string GroupId = "GroupId";

            /// <summary>
            /// GroupName.
            /// </summary>
            public const string GroupName = "GroupName";

            /// <summary>
            /// RoleId.
            /// </summary>
            public const string RoleId = "RoleId";

            /// <summary>
            /// RoleName.
            /// </summary>
            public const string RoleName = "RoleName";

            /// <summary>
            /// CommonValue.
            /// </summary>
            public const string CommonValue = "CommonValue";

            /// <summary>
            /// UserPreferenceId.
            /// </summary>
            public const string UserPreferenceId = "UserPreferenceId";

            /// <summary>
            /// Key.
            /// </summary>
            public const string Key = "Key";

            /// <summary>
            /// Value.
            /// </summary>
            public const string Value = "Value";

            /// <summary>
            /// ModuleId.
            /// </summary>
            public const string ModuleId = "ModuleId";

            /// <summary>
            /// ResourceId.
            /// </summary>
            public const string ResourceId = "ResourceId";

            /// <summary>
            /// UserId.
            /// </summary>
            public const string UserId = "UserId";

            /// <summary>
            /// TempPassword.
            /// </summary>
            public const string TempPassword = "TempPassword";

            /// <summary>
            /// LogId.
            /// </summary>
            public const string LogId = "LogId";

            /// <summary>
            /// ChecksumId.
            /// </summary>
            public const string ChecksumId = "ChecksumId";

            /// <summary>
            /// EventId.
            /// </summary>
            public const string EventId = "EventId";

            /// <summary>
            /// DecorId.
            /// </summary>
            public const string DecorId = "DecorId";

            /// <summary>
            /// SocketId.
            /// </summary>
            public const string SocketId = "SocketId";

            /// <summary>
            /// LampId.
            /// </summary>
            public const string LampId = "LampId";

            /// <summary>
            /// RockId.
            /// </summary>
            public const string RockId = "RockId";

            /// <summary>
            /// PlantId.
            /// </summary>
            public const string PlantId = "PlantId";

            /// <summary>
            /// PlantName.
            /// </summary>
            public const string PlantName = "PlantName";

            /// <summary>
            /// WaterPumpId.
            /// </summary>
            public const string WaterPumpId = "WaterPumpId";

            /// <summary>
            /// PhId.
            /// </summary>
            public const string PhId = "PhId";

            /// <summary>
            /// FishId.
            /// </summary>
            public const string FishId = "FishId";

            /// <summary>
            /// PredatorId.
            /// </summary>
            public const string PredatorId = "PredatorId";

            /// <summary>
            /// PredatorName.
            /// </summary>
            public const string PredatorName = "PredatorName";

            /// <summary>
            /// PotId.
            /// </summary>
            public const string PotId = "PotId";

            /// <summary>
            /// SpotLightId.
            /// </summary>
            public const string SpotLightId = "SpotLightId";

            /// <summary>
            /// LampName.
            /// </summary>
            public const string LampName = "LampName";

            /// <summary>
            /// TankId.
            /// </summary>
            public const string TankId = "TankId";

            /// <summary>
            /// WaterPumpName.
            /// </summary>
            public const string WaterPumpName = "WaterPumpName";

            /// <summary>
            /// Cant.
            /// </summary>
            public const string Cant = "Cant";

            /// <summary>
            /// CommunicationId.
            /// </summary>
            public const string CommunicationId = "CommunicationId";

            /// <summary>
            /// ProductId.
            /// </summary>
            public const string ProductId = "ProductId";

            /// <summary>
            /// PotName.
            /// </summary>
            public const string PotName = "PotName";

            /// <summary>
            /// TankName.
            /// </summary>
            public const string TankName = "TankName";

            /// <summary>
            /// SpotLightName.
            /// </summary>
            public const string SpotLightName = "SpotLightName";

        }

        /// <summary>
        /// Parameters.
        /// </summary>
        public sealed class Parameters
        {
            /// <summary>
            /// Name.
            /// </summary>
            public const string Name = "@Name";

            /// <summary>
            /// Roles.
            /// </summary>
            public const string Roles = "@Roles";

            /// <summary>
            /// GroupId.
            /// </summary>
            public const string GroupId = "@GroupId";

            /// <summary>
            /// ModifiedDate.
            /// </summary>
            public const string ModifiedDate = "@ModifiedDate";

            /// <summary>
            /// UserPreferenceId.
            /// </summary>
            public const string UserPreferenceId = "@UserPreferenceId";

            /// <summary>
            /// DateFormat.
            /// </summary>
            public const string DateFormat = "@DateFormat";

            /// <summary>
            /// TimeZone.
            /// </summary>
            public const string TimeZone = "@TimeZone";

            /// <summary>
            /// Resources.
            /// </summary>
            public const string Resources = "@Resources";

            /// <summary>
            /// LastName.
            /// </summary>
            public const string LastName = "@LastName";

            /// <summary>
            /// Username.
            /// </summary>
            public const string Username = "@Username";

            /// <summary>
            /// Password.
            /// </summary>
            public const string Password = "@Password";

            /// <summary>
            /// UserId.
            /// </summary>
            public const string UserId = "@UserId";

            /// <summary>
            /// Message.
            /// </summary>
            public const string Message = "@Message";

            /// <summary>
            /// Ip.
            /// </summary>
            public const string Ip = "@Ip";

            /// <summary>
            /// Hash.
            /// </summary>
            public const string Hash = "@Hash";

            /// <summary>
            /// LogId.
            /// </summary>
            public const string LogId = "@LogId";

            /// <summary>
            /// Table.
            /// </summary>
            public const string Table = "@Table";

            /// <summary>
            /// Email.
            /// </summary>
            public const string Email = "@Email";

            /// <summary>
            /// LoginAttempts.
            /// </summary>
            public const string LoginAttempts = "@LoginAttempts";

            /// <summary>
            /// IsLocked.
            /// </summary>
            public const string IsLocked = "@IsLocked";

            /// <summary>
            /// Disk.
            /// </summary>
            public const string Disk = "@Disk";

            /// <summary>
            /// TempPassword.
            /// </summary>
            public const string TempPassword = "@TempPassword";

            /// <summary>
            /// EventId.
            /// </summary>
            public const string EventId = "@EventId";

            /// <summary>
            /// Type.
            /// </summary>
            public const string Type = "@Type";

            /// <summary>
            /// Volume.
            /// </summary>
            public const string Volume = "@Volume";

            /// <summary>
            /// DecorId.
            /// </summary>
            public const string DecorId = "@DecorId";

            /// <summary>
            /// LampId.
            /// </summary>
            public const string LampId = "@LampId";

            /// <summary>
            /// Lumen.
            /// </summary>
            public const string Lumen = "@Lumen";

            /// <summary>
            /// Power.
            /// </summary>
            public const string Power = "@Power";

            /// <summary>
            /// SocketId.
            /// </summary>
            public const string SocketId = "@SocketId";

            /// <summary>
            /// IsHydroponic.
            /// </summary>
            public const string IsHydroponic = "@IsHydroponic";

            /// <summary>
            /// IsLowLight.
            /// </summary>
            public const string IsLowLight = "@IsLowLight";

            /// <summary>
            /// PlantId.
            /// </summary>
            public const string PlantId = "@PlantId";

            /// <summary>
            /// FlowRate
            /// </summary>
            public const string FlowRate = "@FlowRate";

            /// <summary>
            /// WaterPumpId.
            /// </summary>
            public const string WaterPumpId = "@WaterPumpId";

            /// <summary>
            /// IsLonely.
            /// </summary>
            public const string IsLonely = "@IsLonely";

            /// <summary>
            /// WaterRequired.
            /// </summary>
            public const string WaterRequired = "@WaterRequired";

            /// <summary>
            /// Size.
            /// </summary>
            public const string Size = "@Size";

            /// <summary>
            /// Temp.
            /// </summary>
            public const string Temp = "@Temp";

            /// <summary>
            /// PhId.
            /// </summary>
            public const string PhId = "@PhId";

            /// <summary>
            /// FishId.
            /// </summary>
            public const string FishId = "@FishId";

            /// <summary>
            /// PredatorId.
            /// </summary>
            public const string PredatorId = "@PredatorId";

            /// <summary>
            /// Predators.
            /// </summary>
            public const string Predators = "@Predators";

            /// <summary>
            /// Heigth.
            /// </summary>
            public const string Heigth = "@Heigth";

            /// <summary>
            /// Length.
            /// </summary>
            public const string Length = "@Length";

            /// <summary>
            /// Rgb.
            /// </summary>
            public const string Rgb = "@Rgb";

            /// <summary>
            /// Width.
            /// </summary>
            public const string Width = "@Width";

            /// <summary>
            /// RockId.
            /// </summary>
            public const string RockId = "@RockId";

            /// <summary>
            /// Plants.
            /// </summary>
            public const string Plants = "@Plants";

            /// <summary>
            /// PotId.
            /// </summary>
            public const string PotId = "@PotId";

            /// <summary>
            /// Slots.
            /// </summary>
            public const string Slots = "@Slots";

            /// <summary>
            /// Lamps.
            /// </summary>
            public const string Lamps = "@Lamps";

            /// <summary>
            /// SpotLightId.
            /// </summary>
            public const string SpotLightId = "@SpotLightId";

            /// <summary>
            /// TankId.
            /// </summary>
            public const string TankId = "@TankId";

            /// <summary>
            /// WaterTemp.
            /// </summary>
            public const string WaterTemp = "@WaterTemp";

            /// <summary>
            /// Decors.
            /// </summary>
            public const string Decors = "@Decors";

            /// <summary>
            /// Fishes.
            /// </summary>
            public const string Fishes = "@Fishes";

            /// <summary>
            /// Response.
            /// </summary>
            public const string Response = "@Response";

            /// <summary>
            /// CommunicationId.
            /// </summary>
            public const string CommunicationId = "@CommunicationId";

            /// <summary>
            /// ProductId.
            /// </summary>
            public const string ProductId = "@ProductId";
        }
    }
}
