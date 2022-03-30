// --------------------------------------------------------------------
// <copyright file="DateTimeExtension.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Common.Extensions
{
    using System;

    /// <summary>
    /// DateTimeExtension.
    /// </summary>
    public static class DateTimeExtension
    {
        /// <summary>
        /// ToDateTime2.
        /// </summary>
        /// <param name="dateTime">DateTime.</param>
        /// <returns>Date as yyyy-MM-dd HH:mm:ss.fffffff.</returns>
        public static string ToDateTime2(this DateTime dateTime)
        {
            return dateTime.ToString("yyyy-MM-dd HH:mm:ss.fffffff");
        }

        /// <summary>
        /// ToShortDateTime2.
        /// </summary>
        /// <param name="dateTime">DateTime.</param>
        /// <returns>Date as yyyyMMdd.HHmmss.fffffff.</returns>
        public static string ToShortDateTime2(this DateTime dateTime)
        {
            return dateTime.ToString("yyyyMMdd.HHmmss.fffffff");
        }
    }
}
