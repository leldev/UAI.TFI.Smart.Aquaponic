// --------------------------------------------------------------------
// <copyright file="ResourceHelper.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Common.Helpers
{
    using Newtonsoft.Json;
    using SmartAquaponic.Common.Model;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Net.Http;
    using System.Text;
    using System.Threading.Tasks;
    using System.Xml.XPath;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// ResourceHelper.
    /// </summary>
    public static class ResourceHelper
    {
        private static readonly string subscriptionKey = "21a356fd93ca4bc1893cfaf94f30dec9";
        private static readonly string endpoint = "https://api.cognitive.microsofttranslator.com/";
        private static readonly string location = "brazilsouth";

        public static IDictionary<string, string> resources = new Dictionary<string, string>()
        {
            { Constants.Errors.UnexpectedError, Constants.Messages.UnexpectedError },
            { Constants.Errors.NoResultsFound, Constants.Messages.NoResultsFoundError },
            { Constants.Errors.Concurrence, Constants.Messages.ConcurrenceError },
            { Constants.Errors.AlreadyExist, Constants.Messages.AlreadyExistError },
            { Constants.Errors.NotDeleteble, Constants.Messages.NotDeleteble },
            { Constants.Errors.LoginFail, Constants.Messages.LoginFail },
            { Constants.Errors.UserChecksumFail, Constants.Messages.UserChecksumFail },
            { Constants.Errors.UserNotAllowedLogin, Constants.Messages.UserNotAllowedLogin },
            { Constants.Errors.UserLocked, Constants.Messages.UserLocked },
            { Constants.Errors.IntegrityFail, Constants.Messages.IntegrityError },
            { Constants.Errors.Unauthorized, Constants.Messages.Unauthorized },
            { Constants.Successes.RestoreSuccess, Constants.Messages.RestoreSuccess },
            { Constants.Successes.IntegritySuccess, Constants.Messages.IntegritySuccess },
            { Constants.Successes.BackupSuccess, Constants.Messages.BackupSuccess },
            { Constants.Successes.MessageSent, Constants.Messages.MessageSent },
            { Constants.Resources.MenuLogout, Constants.Messages.Logout },
            { Constants.Resources.MenuLanguageManagemenet, Constants.Messages.LanguageManagement },
            { Constants.Resources.MenuBackOffice, Constants.Messages.BackOffice },
            { Constants.Resources.MenuDatabaseManagement, Constants.Messages.DatabaseManagement },
            { Constants.Resources.MenuLogs, Constants.Messages.Logs },
            { Constants.Resources.MenuPermissionManager, Constants.Messages.PermissionManagement },
            { Constants.Resources.MenuUserManagement, Constants.Messages.UserManagement },
            { Constants.Resources.MenuInventory, Constants.Messages.Inventory },
            { Constants.Resources.MenuTankManagement, Constants.Messages.TankManagement },
            { Constants.Resources.MenuFishManagement, Constants.Messages.FishManagement },
            { Constants.Resources.MenuDecorManagement, Constants.Messages.DecorManagement },
            { Constants.Resources.MenuWaterPumpManagement, Constants.Messages.WaterPumpManagement },
            { Constants.Resources.MenuPotManagement, Constants.Messages.PotManagement },
            { Constants.Resources.MenuPlantManagement, Constants.Messages.PlantManagement },
            { Constants.Resources.MenuSpotLightManagement, Constants.Messages.SpotLightManagement },
            { Constants.Resources.MenuLampManagement, Constants.Messages.LampManagement },
            { Constants.Resources.MenuProduct, Constants.Messages.Product },
            { Constants.Resources.MenuProductManagement, Constants.Messages.ProductManagement },
            { Constants.Resources.ClayPebble, Constants.Messages.ClayPebble },
            { Constants.Resources.ExpandedShale, Constants.Messages.ExpandedShale },
            { Constants.Resources.Growstone, Constants.Messages.Growstone },
            { Constants.Resources.LavaRock, Constants.Messages.LavaRock },
            { Constants.Resources.Red, Constants.Messages.Red },
            { Constants.Resources.Pink, Constants.Messages.Pink },
            { Constants.Resources.Orange, Constants.Messages.Orange },
            { Constants.Resources.Beige, Constants.Messages.Beige },
            { Constants.Resources.Yellow, Constants.Messages.Yellow },
            { Constants.Resources.LimeGreen, Constants.Messages.LimeGreen },
            { Constants.Resources.Green, Constants.Messages.Green },
            { Constants.Resources.DarkGreen, Constants.Messages.DarkGreen },
            { Constants.Resources.Tarquoise, Constants.Messages.Tarquoise },
            { Constants.Resources.PaleBlue, Constants.Messages.PaleBlue },
            { Constants.Resources.Blue, Constants.Messages.Blue },
            { Constants.Resources.DarkBlue, Constants.Messages.DarkBlue },
            { Constants.Resources.Violet, Constants.Messages.Violet },
            { Constants.Resources.Purple, Constants.Messages.Purple },
            { Constants.Resources.MenuLogin, Constants.Messages.Login },
            { Constants.Resources.MenuContacUs, Constants.Messages.ContactUs },
            { Constants.Resources.MenuComunication, Constants.Messages.Comunication },
            { Constants.Resources.MenuReports, Constants.Messages.Reports },
            { Constants.Resources.MenuReportsNotUsed, Constants.Messages.ReportNotUsed },
            { Constants.Resources.MenuReportsMostUsed, Constants.Messages.ReportMostUsed },
            { Constants.Resources.LtlWhatsAquaponicTitle, Constants.Messages.WhatsAquaponic },
            { Constants.Resources.LtlWhatsAquaponicFish, Constants.Messages.FishProduceWaste },
            { Constants.Resources.LtlWhatsAquaponicWater, Constants.Messages.WaterPumped },
            { Constants.Resources.LtlWhatsAquaponicPlant, Constants.Messages.PlantsNutrients },
            { Constants.Resources.LtlWhatsAquaponicRecycle, Constants.Messages.CleanWater },
            { Constants.Resources.LtlTransformEnvironmentTitle, Constants.Messages.TansformYourEnvironment },
            { Constants.Resources.LtlTransformEnvironmentDescription1, Constants.Messages.TansformYourEnvironmentDescription1 },
            { Constants.Resources.LtlTransformEnvironmentDescription2, Constants.Messages.TansformYourEnvironmentDescription2 },
            { Constants.Resources.LtlTransformEnvironmentNatural, Constants.Messages.Natural },
            { Constants.Resources.LtlTransformEnvironmentNaturalDescription1, Constants.Messages.NaturalDescription1 },
            { Constants.Resources.LtlTransformEnvironmentNaturalDescription2, Constants.Messages.NaturalDescription2 },
            { Constants.Resources.LtlTransformEnvironmentBeatiful, Constants.Messages.Beautiful },
            { Constants.Resources.LtlTransformEnvironmentBeatifulDescription1, Constants.Messages.BeautifulDescription1 },
            { Constants.Resources.LtlTransformEnvironmentBeatifulDescription2, Constants.Messages.BeautifulDescription2 },
            { Constants.Resources.LtlTransformEnvironmentEducationalTitle, Constants.Messages.Educational },
            { Constants.Resources.LtlTransformEnvironmentEducationalDescription1, Constants.Messages.EducationalDescription1 },
            { Constants.Resources.LtlTransformEnvironmentEducationalDescription2, Constants.Messages.EducationalDescription2 },
            { Constants.Resources.LtlTransformEnvironmentFunctionalTitle, Constants.Messages.Functional },
            { Constants.Resources.LtlTransformEnvironmentFunctionalDescription1, Constants.Messages.FunctionalDescription1 },
            { Constants.Resources.LtlTransformEnvironmentFunctionalDescription2, Constants.Messages.FunctionalDescription2 },
            { Constants.Resources.CreatedBy, Constants.Messages.CreatedBy },
            { Constants.Resources.CreatedDate, Constants.Messages.CreatedDate },
            { Constants.Resources.HeaderName, Constants.Messages.Name },
            { Constants.Resources.HeaderType, Constants.Messages.Type },
            { Constants.Resources.HeaderCant, Constants.Messages.Cant },
            { Constants.Resources.Pages, Constants.Messages.Pages },
            { Constants.Resources.Cant, Constants.Messages.Cant },
            { Constants.Controls.BtnDelete, Constants.Messages.Delete },
            { Constants.Controls.BtnUpdate, Constants.Messages.Update },
            { Constants.Controls.BtnGeneratePassowrd, Constants.Messages.GeneratePassword },
            { Constants.Controls.BtnUnlock, Constants.Messages.Unlock },
            { Constants.Controls.BtnRecovery, Constants.Messages.Recovery },
            { Constants.Controls.BtnBackup, Constants.Messages.Backup },
            { Constants.Controls.BtnVerify, Constants.Messages.Verify },
            { Constants.Controls.BtnGeneratePassword, Constants.Messages.GeneratePassword },
            { Constants.Controls.BtnRecoveryPassword, Constants.Messages.RecoveryPassword },
            { Constants.Controls.BtnSend, Constants.Messages.Send },
            { Constants.Controls.BtnRestore, Constants.Messages.Restore },
            { Constants.Controls.BtnSignIn, Constants.Messages.SingIn },
            { Constants.Controls.BtnCreate, Constants.Messages.Create },
            { Constants.Controls.BtnTranslate, Constants.Messages.Translate },
            { Constants.Controls.LblPermisionTitle, Constants.Messages.Permissions },
            { Constants.Controls.LblCreatePermissionTitle, Constants.Messages.CreatePermission },
            { Constants.Controls.LblName, Constants.Messages.Name },
            { Constants.Controls.LblRequired, Constants.Messages.Required },
            { Constants.Controls.LblRoles, Constants.Messages.Roles },
            { Constants.Controls.LblDeletePermissionTitle, Constants.Messages.DeletePermission },
            { Constants.Controls.LblGroupName, Constants.Messages.Name },
            { Constants.Controls.LblUpdatePermisionTitle, Constants.Messages.UpdatePermision },
            { Constants.Controls.LblUserPreferenceTitle, Constants.Messages.UserPreference },
            { Constants.Controls.LblUpdateUserPreferenceTitle, Constants.Messages.UpdateUserPreference },
            { Constants.Controls.LblDateFormat, Constants.Messages.DateFormat },
            { Constants.Controls.LblTimeZone, Constants.Messages.TimeZone },
            { Constants.Controls.LblResources, Constants.Messages.Resources },
            { Constants.Controls.LblDeleteUserPreferenceTitle, Constants.Messages.DeleteUserPreference },
            { Constants.Controls.LblCreateUserPreferenceTitle, Constants.Messages.CreateUserPreference },
            { Constants.Controls.LblUserTitle, Constants.Messages.Users },
            { Constants.Controls.LblCreateUserTitle, Constants.Messages.CreateUser },
            { Constants.Controls.LblDeleteUserTitle, Constants.Messages.DeleteUser },
            { Constants.Controls.LblUpdateUserTitle, Constants.Messages.UpdateUser },
            { Constants.Controls.LblProductTitle, Constants.Messages.Products },
            { Constants.Controls.LblCreateProductTitle, Constants.Messages.CreateProduct },
            { Constants.Controls.LblDeleteProductTitle, Constants.Messages.DeleteProduct },
            { Constants.Controls.LblUpdateProductTitle, Constants.Messages.UpdateProduct },
            { Constants.Controls.LblLastName, Constants.Messages.LastName },
            { Constants.Controls.LblUsername, Constants.Messages.Username },
            { Constants.Controls.LblPermission, Constants.Messages.Permission },
            { Constants.Controls.LblPassword, Constants.Messages.Password },
            { Constants.Controls.LblLoginTitle, Constants.Messages.Login },
            { Constants.Controls.LblLanguage, Constants.Messages.Language },
            { Constants.Controls.LblLogsTitle, Constants.Messages.Logs },
            { Constants.Controls.LblEmail, Constants.Messages.Email },
            { Constants.Controls.LblDatabaseTitle, Constants.Messages.DatabaseManagement },
            { Constants.Controls.LblVolumes, Constants.Messages.Volumes },
            { Constants.Controls.LblBackup, Constants.Messages.Backup },
            { Constants.Controls.LblRecoveryPasswordTitle, Constants.Messages.RecoveryPassword },
            { Constants.Controls.LblEnterEmail, Constants.Messages.EnterEmail },
            { Constants.Controls.LblContactUsTitle, Constants.Messages.ContactUs },
            { Constants.Controls.LblMessage, Constants.Messages.Message },
            { Constants.Controls.LblTempPassword, Constants.Messages.TempPassword },
            { Constants.Controls.LblNewPassword, Constants.Messages.NewPassword },
            { Constants.Controls.LblDecorTitle, Constants.Messages.Decors },
            { Constants.Controls.LblCreateDecorTitle, Constants.Messages.CreateDecor },
            { Constants.Controls.LblType, Constants.Messages.Type },
            { Constants.Controls.LblVolume, Constants.Messages.Volume },
            { Constants.Controls.LblDeleteDecorTitle, Constants.Messages.DeleteDecor },
            { Constants.Controls.LblUpdateDecorTitle, Constants.Messages.UpdateDecor },
            { Constants.Controls.LblLampTitle, Constants.Messages.Lamps },
            { Constants.Controls.LblCreateLampTitle, Constants.Messages.CreateLamp },
            { Constants.Controls.LblDeleteLampTitle, Constants.Messages.DeleteLamp },
            { Constants.Controls.LblUpdateLampTitle, Constants.Messages.UpdateLamp },
            { Constants.Controls.LblLumen, Constants.Messages.Lumen },
            { Constants.Controls.LblPower, Constants.Messages.Power },
            { Constants.Controls.LblSocket, Constants.Messages.Socket },
            { Constants.Controls.LblPlantTitle, Constants.Messages.Plants },
            { Constants.Controls.LblCreatePlantTitle, Constants.Messages.CreatePlant },
            { Constants.Controls.LblDeletePlantTitle, Constants.Messages.DeletePlant },
            { Constants.Controls.LblUpdatePlantTitle, Constants.Messages.UpdatePlant },
            { Constants.Controls.LblIsHydroponic, Constants.Messages.IsHydroponic },
            { Constants.Controls.LblIsLowLight, Constants.Messages.IsLowLight },
            { Constants.Controls.LblWaterPumpTitle, Constants.Messages.WaterPumps },
            { Constants.Controls.LblCreateWaterPumpTitle, Constants.Messages.CreateWaterPump },
            { Constants.Controls.LblDeleteWaterPumpTitle, Constants.Messages.DeleteWaterPump },
            { Constants.Controls.LblUpdateWaterPumpTitle, Constants.Messages.UpdateWaterPump },
            { Constants.Controls.LblFlowRate, Constants.Messages.FlowRate },
            { Constants.Controls.LblFishTitle, Constants.Messages.Fishes },
            { Constants.Controls.LblCreateFishTitle, Constants.Messages.CreateFish },
            { Constants.Controls.LblDeleteFishTitle, Constants.Messages.DeleteFish },
            { Constants.Controls.LblUpdateFishTitle, Constants.Messages.UpdateFish },
            { Constants.Controls.LblSize, Constants.Messages.Size },
            { Constants.Controls.LblTemp, Constants.Messages.Temp },
            { Constants.Controls.LblPh, Constants.Messages.Ph },
            { Constants.Controls.LblWaterRequired, Constants.Messages.WaterRequired },
            { Constants.Controls.LblIsLonely, Constants.Messages.IsLonely },
            { Constants.Controls.LblPlants, Constants.Messages.Plants },
            { Constants.Controls.LblPotTitle, Constants.Messages.Pots },
            { Constants.Controls.LblCreatePotTitle, Constants.Messages.CreatePot },
            { Constants.Controls.LblDeletePotTitle, Constants.Messages.DeletePot },
            { Constants.Controls.LblUpdatePotTitle, Constants.Messages.UpdatePot },
            { Constants.Controls.LblRgb, Constants.Messages.Rgb },
            { Constants.Controls.LblHeigth, Constants.Messages.Heigth },
            { Constants.Controls.LblLength, Constants.Messages.Length },
            { Constants.Controls.LblWidth, Constants.Messages.Width },
            { Constants.Controls.LblWeight, Constants.Messages.Weight },
            { Constants.Controls.LblRock, Constants.Messages.Rock },
            { Constants.Controls.LblPredators, Constants.Messages.Predators },
            { Constants.Controls.LblSpotLightTitle, Constants.Messages.SpotLights },
            { Constants.Controls.LblCreateSpotLightTitle, Constants.Messages.CreateSpotLight },
            { Constants.Controls.LblDeleteSpotLightTitle, Constants.Messages.DeleteSpotLight },
            { Constants.Controls.LblUpdateSpotLightTitle, Constants.Messages.UpdateSpotLight },
            { Constants.Controls.LblSlots, Constants.Messages.Slots },
            { Constants.Controls.LblTankTitle, Constants.Messages.Tanks },
            { Constants.Controls.LblCreateTankTitle, Constants.Messages.CreateTank },
            { Constants.Controls.LblDeleteTankTitle, Constants.Messages.DeleteTank },
            { Constants.Controls.LblUpdateTankTitle, Constants.Messages.UpdateTank },
            { Constants.Controls.LblFishes, Constants.Messages.Fishes },
            { Constants.Controls.LblDecors, Constants.Messages.Decors },
            { Constants.Controls.LblWaterPump, Constants.Messages.WaterPump },
            { Constants.Controls.LblWaterTemp, Constants.Messages.WaterTemp },
            { Constants.Controls.LblGroups, Constants.Messages.Groups },
            { Constants.Controls.LblLamp, Constants.Messages.Lamp },
            { Constants.Controls.LblRestore, Constants.Messages.Restore },
            { Constants.Controls.LblVerifyIntegrity, Constants.Messages.VerifyIntegrity },
            { Constants.Controls.LblTranslate, Constants.Messages.Translate },
            { Constants.Controls.LblResponse, Constants.Messages.Response },
            { Constants.Controls.LblTank, Constants.Messages.Tank },
            { Constants.Controls.LblPot, Constants.Messages.Pot },
            { Constants.Controls.LblSpotLight, Constants.Messages.SpotLight },
            { Constants.Controls.LtlName, Constants.Messages.Name },
            { Constants.Controls.LtlRoleCount, Constants.Messages.RoleCount },
            { Constants.Controls.LtlCreateDate, Constants.Messages.CreatedDate },
            { Constants.Controls.LtlModifiedDate, Constants.Messages.ModifiedDate },
            { Constants.Controls.LtlDateFormat, Constants.Messages.DateFormat },
            { Constants.Controls.LtlTimeZone, Constants.Messages.TimeZone },
            { Constants.Controls.LtlIsDefault, Constants.Messages.IsDefault },
            { Constants.Controls.LtlKey, Constants.Messages.Key },
            { Constants.Controls.LtlValue, Constants.Messages.Value },
            { Constants.Controls.LtlLastName, Constants.Messages.LastName },
            { Constants.Controls.LtlUsername, Constants.Messages.Username },
            { Constants.Controls.LtlIsLocked, Constants.Messages.IsLocked },
            { Constants.Controls.LtlIp, Constants.Messages.Ip },
            { Constants.Controls.LtlMessage, Constants.Messages.Message },
            { Constants.Controls.LtlEvent, Constants.Messages.Event },
            { Constants.Controls.LtlUser, Constants.Messages.User },
            { Constants.Controls.LtlEmail, Constants.Messages.Email },
            { Constants.Controls.LtlVerify, Constants.Messages.Verify },
            { Constants.Controls.LtlBackup, Constants.Messages.Backup },
            { Constants.Controls.LtlRestore, Constants.Messages.Restore },
            { Constants.Controls.LtlType, Constants.Messages.Type },
            { Constants.Controls.LtlVolume, Constants.Messages.Volume },
            { Constants.Controls.LtlLumen, Constants.Messages.Lumen },
            { Constants.Controls.LtlPower, Constants.Messages.Power },
            { Constants.Controls.LtlSocket, Constants.Messages.Socket },
            { Constants.Controls.LtlIsHydroponic, Constants.Messages.IsHydroponic },
            { Constants.Controls.LtlIsLowLight, Constants.Messages.IsLowLight },
            { Constants.Controls.LtlFlowRate, Constants.Messages.FlowRate },
            { Constants.Controls.LtlSize, Constants.Messages.Size },
            { Constants.Controls.LtlTemp, Constants.Messages.Temp },
            { Constants.Controls.LtlPh, Constants.Messages.Ph },
            { Constants.Controls.LtlWaterRequired, Constants.Messages.WaterRequired },
            { Constants.Controls.LtlIsLonely, Constants.Messages.IsLonely },
            { Constants.Controls.LtlPredators, Constants.Messages.Predators },
            { Constants.Controls.LtlPlants, Constants.Messages.Plants },
            { Constants.Controls.LtlRgb, Constants.Messages.Rgb },
            { Constants.Controls.LtlHeigth, Constants.Messages.Heigth },
            { Constants.Controls.LtlLength, Constants.Messages.Length },
            { Constants.Controls.LtlWidth, Constants.Messages.Width },
            { Constants.Controls.LtlWeight, Constants.Messages.Weight },
            { Constants.Controls.LtlRock, Constants.Messages.Rock },
            { Constants.Controls.LtlSlots, Constants.Messages.Slots },
            { Constants.Controls.LtlLamp, Constants.Messages.Lamp },
            { Constants.Controls.LtlFishes, Constants.Messages.Fishes },
            { Constants.Controls.LtlDecors, Constants.Messages.Decors },
            { Constants.Controls.LtlWaterPump, Constants.Messages.WaterPump },
            { Constants.Controls.LtlWaterTemp, Constants.Messages.WaterTemp },
            { Constants.Controls.LtlCant, Constants.Messages.Cant },
            { Constants.Controls.LtlIsAnswered, Constants.Messages.IsAnswered },
            { Constants.Controls.LtlResponse, Constants.Messages.Response },
            { Constants.Controls.LtlTank, Constants.Messages.Tank },
            { Constants.Controls.LtlPot, Constants.Messages.Pot },
            { Constants.Controls.LtlSpotLight, Constants.Messages.SpotLight },
            { Constants.Controls.LtlHydroponicWarning, Constants.Messages.HydroponicWarning },
            { Constants.Controls.LtlLightWarning, Constants.Messages.LightWarning },
            { Constants.Controls.LtlReportNotUsedTitle, Constants.Messages.ReportNotUsed },
            { Constants.Controls.LtlReportMostUsedTitle, Constants.Messages.ReportMostUsed },
            { Constants.Controls.CbxIsHydroponic, Constants.Messages.IsHydroponic },
            { Constants.Controls.CbxIsLowLight, Constants.Messages.IsLowLight },
            { Constants.Controls.CbxIsLonely, Constants.Messages.IsLonely },
        };

        public static IDictionary<string, string> resourcesEs = new Dictionary<string, string>()
        {
            { Constants.Resources.MenuContacUs, Constants.MessagesEs.ContactUs },
            { Constants.Resources.MenuLogin, Constants.MessagesEs.Login },
            { Constants.Controls.LblUsername, Constants.MessagesEs.Username },
            { Constants.Controls.LblPassword, Constants.MessagesEs.Password },
            { Constants.Controls.BtnRecoveryPassword, Constants.MessagesEs.RecoveryPassword },
            { Constants.Controls.BtnSignIn, Constants.MessagesEs.SingIn },
            { Constants.Controls.LblLoginTitle, Constants.MessagesEs.Login },
            { Constants.Controls.LblEnterEmail, Constants.MessagesEs.EnterEmail },
            { Constants.Controls.LblContactUsTitle, Constants.MessagesEs.ContactUs },
            { Constants.Controls.LblName, Constants.MessagesEs.Name },
            { Constants.Controls.LblEmail, Constants.MessagesEs.Email },
            { Constants.Controls.LblMessage, Constants.MessagesEs.Message },
            { Constants.Controls.BtnSend, Constants.MessagesEs.Send },
            { Constants.Resources.LtlWhatsAquaponicTitle, Constants.MessagesEs.WhatsAquaponic },
            { Constants.Resources.LtlWhatsAquaponicFish, Constants.MessagesEs.FishProduceWaste },
            { Constants.Resources.LtlWhatsAquaponicWater, Constants.MessagesEs.WaterPumped },
            { Constants.Resources.LtlWhatsAquaponicPlant, Constants.MessagesEs.PlantsNutrients },
            { Constants.Resources.LtlWhatsAquaponicRecycle, Constants.MessagesEs.CleanWater },
            { Constants.Resources.LtlTransformEnvironmentTitle, Constants.MessagesEs.TansformYourEnvironment },
            { Constants.Resources.LtlTransformEnvironmentDescription1, Constants.MessagesEs.TansformYourEnvironmentDescription1 },
            { Constants.Resources.LtlTransformEnvironmentDescription2, Constants.MessagesEs.TansformYourEnvironmentDescription2 },
            { Constants.Resources.LtlTransformEnvironmentNatural, Constants.MessagesEs.Natural },
            { Constants.Resources.LtlTransformEnvironmentNaturalDescription1, Constants.MessagesEs.NaturalDescription1 },
            { Constants.Resources.LtlTransformEnvironmentNaturalDescription2, Constants.MessagesEs.NaturalDescription2 },
            { Constants.Resources.LtlTransformEnvironmentBeatiful, Constants.MessagesEs.Beautiful },
            { Constants.Resources.LtlTransformEnvironmentBeatifulDescription1, Constants.MessagesEs.BeautifulDescription1 },
            { Constants.Resources.LtlTransformEnvironmentBeatifulDescription2, Constants.MessagesEs.BeautifulDescription2 },
            { Constants.Resources.LtlTransformEnvironmentEducationalTitle, Constants.MessagesEs.Educational },
            { Constants.Resources.LtlTransformEnvironmentEducationalDescription1, Constants.MessagesEs.EducationalDescription1 },
            { Constants.Resources.LtlTransformEnvironmentEducationalDescription2, Constants.MessagesEs.EducationalDescription2 },
            { Constants.Resources.LtlTransformEnvironmentFunctionalTitle, Constants.MessagesEs.Functional },
            { Constants.Resources.LtlTransformEnvironmentFunctionalDescription1, Constants.MessagesEs.FunctionalDescription1 },
            { Constants.Resources.LtlTransformEnvironmentFunctionalDescription2, Constants.MessagesEs.FunctionalDescription2 },
        };

        /// <summary>
        /// GerLocalResourceValue
        /// </summary>
        /// <param name="language">Language.</param>
        /// <returns>Resource as string.</returns>
        public static string GerLocalResourceValue(string language, string key)
        {
            var result = string.Empty;

            if (Constants.Languages.Spanish == language)
            {
                if (resourcesEs.ContainsKey(key))
                {
                    result = resourcesEs[key];
                }
            }

            return result;
        }

        /// <summary>
        /// Get resourve value.
        /// </summary>
        /// <param name="key">Key.</param>
        /// <returns>Resource value.</returns>
        public static string GerResourceValue(string key)
        {
            var result = string.Empty;

            if (!string.IsNullOrEmpty(key))
            {
                if (key.StartsWith(Constants.Controls.LblRequired))
                {
                    key = Constants.Controls.LblRequired;
                }

                if (resources.ContainsKey(key))
                {
                    result = resources[key];
                }
            }

            return result;
        }

        public static Dictionary<string, string> GetLanguageList()
        {
            var langs = new Dictionary<string, string>()
            {
                {"Afrikaans", "af"},
                { "Arabic", "ar"},
                { "Assamese", "as"},
                { "Bangla", "bn"},
                { "Bosnian (Latin)", "bs"},
                { "Bulgarian", "bg"},
                { "Cantonese (Traditional)", "yue"},
                { "Catalan", "ca"},
                { "Chinese Simplified", "zh-Hans"},
                { "Chinese Traditional", "zh-Hant"},
                { "Croatian", "hr"},
                { "Czech", "cs"},
                { "Dari", "prs"},
                { "Danish", "da"},
                { "Dutch", "nl"},
                { "English", "en"},
                { "Estonian", "et"},
                { "Fijian", "fj"},
                { "Filipino", "fil"},
                { "Finnish", "fi"},
                { "French", "fr"},
                { "French (Canada)", "fr-ca"},
                { "German", "de"},
                { "Greek", "el"},
                { "Gujarati", "gu"},
                { "Haitian Creole", "ht"},
                { "Hebrew", "he"},
                { "Hindi", "hi"},
                { "Hmong Daw", "mww"},
                { "Hungarian", "hu"},
                { "Icelandic", "is"},
                { "Indonesian", "id"},
                { "Irish", "ga"},
                { "Italian", "it"},
                { "Japanese", "ja"},
                { "Kannada", "kn"},
                { "Kazakh", "kk"},
                { "Klingon", "tlh-Latn"},
                { "Klingon (plqaD)", "tlh-Piqd"},
                { "Korean", "ko"},
                { "Kurdish (Central)", "ku"},
                { "Kurdish (Northern)", "kmr"},
                { "Latvian", "lv"},
                { "Lithuanian", "lt"},
                { "Malagasy", "mg"},
                { "Malay", "ms"},
                { "Malayalam", "ml"},
                { "Maltese", "mt"},
                { "Maori", "mi"},
                { "Marathi", "mr"},
                { "Norwegian", "nb"},
                { "Odia", "or"},
                { "Pashto", "ps"},
                { "Persian", "fa"},
                { "Polish", "pl"},
                { "Portuguese (Brazil)", "pt-br"},
                { "Portuguese (Portugal)", "pt-pt"},
                { "Punjabi", "pa"},
                { "Queretaro Otomi", "otq"},
                { "Romanian", "ro"},
                { "Russian", "ru"},
                { "Samoan", "sm"},
                { "Serbian (Cyrillic)", "sr-Cyrl"},
                { "Serbian (Latin)", "sr-Latn"},
                { "Slovak", "sk"},
                { "Slovenian", "sl"},
                { "Spanish", "es"},
                { "Swahili", "sw"},
                { "Swedish", "sv"},
                { "Tahitian", "ty"},
                { "Tamil", "ta"},
                { "Telugu", "te"},
                { "Thai", "th"},
                { "Tongan", "to"},
                { "Turkish", "tr"},
                { "Ukrainian", "uk"},
                { "Urdu", "ur"},
                { "Vietnamese", "vi"},
                { "Welsh", "cy"},
                { "Yucatec Maya", "yua"},
            };

            return langs;
        }

        public static async Task<Dictionary<string, string>> Translate(Dictionary<string, string> resources, string to)
        {
            var translateList = new List<Translate>();

            string route = $"/translate?api-version=3.0&from=en&to={to}";

            object[] body = new object[resources.Count];

            for (int i = 0; i < resources.Count; i++)
            {
                body[i] = new { Text = resources.ElementAt(i).Value };
            }

            int recordPerPage = 20;
            for (int i = 0; i < resources.Count; i++)
            {
                var values = body.Skip(recordPerPage * i).Take(recordPerPage).ToList();

                if (values.Any())
                {
                    var requestBody = JsonConvert.SerializeObject(values);

                    using (var client = new HttpClient())
                    using (var request = new HttpRequestMessage())
                    {
                        // Build the request.
                        request.Method = HttpMethod.Post;
                        request.RequestUri = new Uri(endpoint + route);
                        request.Content = new StringContent(requestBody, Encoding.UTF8, "application/json");
                        request.Headers.Add("Ocp-Apim-Subscription-Key", subscriptionKey);
                        request.Headers.Add("Ocp-Apim-Subscription-Region", location);

                        // Send the request and get response.
                        HttpResponseMessage response = await client.SendAsync(request).ConfigureAwait(false);

                        // Read response as a string.
                        string result = await response.Content.ReadAsStringAsync();
                        var aux = JsonConvert.DeserializeObject<List<Translate>>(result);
                        translateList.AddRange(aux);
                    }
                }
                else
                {
                    break;
                }
            }

            for (int i = 0; i < translateList.Count; i++)
            {
                resources[resources.ElementAt(i).Key] = translateList[i].Translations[0].Text;
            }

            return resources;
        }
    }
}
