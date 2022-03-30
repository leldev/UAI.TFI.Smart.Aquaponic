// --------------------------------------------------------------------
// <copyright file="BootstrapHerlper.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Common.Helpers
{
    using SmartAquaponic.Common.Enum;
    using Constants = SmartAquaponic.Common.Constants.WebConstant;

    /// <summary>
    /// BootstrapHerlper.
    /// </summary>
    public static class BootstrapHerlper
    {
        /// <summary>
        /// GetAlertClass.
        /// </summary>
        /// <param name="type">BootstrapContextualType.</param>
        /// <returns>Alert class name.</returns>
        public static string GetAlertClass(BootstrapContextualType type)
        {
            switch (type)
            {
                case BootstrapContextualType.Danger:
                    return Constants.CssClassName.AlertDanger;
                case BootstrapContextualType.Dark:
                    return Constants.CssClassName.AlertDark;
                case BootstrapContextualType.Info:
                    return Constants.CssClassName.AlertInfo;
                case BootstrapContextualType.Light:
                    return Constants.CssClassName.AlertLight;
                case BootstrapContextualType.Primary:
                    return Constants.CssClassName.AlertPrimary;
                case BootstrapContextualType.Secondary:
                    return Constants.CssClassName.AlertSecondary;
                case BootstrapContextualType.Warning:
                    return Constants.CssClassName.AlertWarning;
                default:
                    return string.Empty;
            }
        }

        /// <summary>
        /// GetAlertDismissibleClass.
        /// </summary>
        /// <returns>Alert dismissible class name.</returns>
        public static string GetAlertDismissibleClass()
        {
            return $"{Constants.CssClassName.AlertDismissible} {Constants.CssClassName.Fade} {Constants.CssClassName.Show}";
        }

        /// <summary>
        /// GetValidFormClass.
        /// </summary>
        /// <returns>Valid form group.</returns>
        public static string GetValidFormClass()
        {
            return $"{Constants.CssClassName.FormGroup} {Constants.CssClassName.IsValid}";
        }

        /// <summary>
        /// GetInvalidFormClass.
        /// </summary>
        /// <returns>Invalid form group.</returns>
        public static string GetInvalidFormClass()
        {
            return $"{Constants.CssClassName.FormGroup} {Constants.CssClassName.IsInvalid}";
        }

        /// <summary>
        /// GetValidFormPlaintextClass.
        /// </summary>
        /// <returns>Valid form group.</returns>
        public static string GetValidFormPlaintextClass()
        {
            return $"{Constants.CssClassName.FormControlPlaintext} {Constants.CssClassName.IsValid}";
        }

        /// <summary>
        /// GetInvalidFormPlaintextClass.
        /// </summary>
        /// <returns>Invalid form group.</returns>
        public static string GetInvalidFormPlaintextClass()
        {
            return $"{Constants.CssClassName.FormControlPlaintext} {Constants.CssClassName.IsInvalid}";
        }
    }
}
