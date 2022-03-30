// --------------------------------------------------------------------
// <copyright file="SqlHelper.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.DataAccess
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using SmartAquaponic.Common.Interfaces;
    using Constatns = SmartAquaponic.Common.Constants.DataAccessConstant;

    /// <summary>
    /// SqlHelper.
    /// </summary>
    public static class SqlHelper
    {
        /// <summary>
        /// GetDataTableFromList.
        /// </summary>
        /// <typeparam name="T">IEntity.</typeparam>
        /// <param name="entities">List of IEntity.</param>
        /// <returns>DataTable.</returns>
        public static DataTable GetDataTableFromList<T>(IList<T> entities)
            where T : IEntity
        {
            var table = new DataTable();
            table.Columns.Add(Constatns.Columns.CommonValue, typeof(int));

            foreach (var item in entities)
            {
                var row = table.NewRow();
                row[Constatns.Columns.CommonValue] = item.Id;
                table.Rows.Add(row);
            }

            return table;
        }

        /// <summary>
        /// GetParameter.
        /// </summary>
        /// <param name="name">Name.</param>
        /// <param name="value">Value.</param>
        /// <returns>SqlParameter.</returns>
        public static SqlParameter GetParameter(string name, string value) => new SqlParameter
        {
            ParameterName = name,
            Value = value,
            SqlDbType = SqlDbType.Text,
        };

        /// <summary>
        /// GetParameter.
        /// </summary>
        /// <param name="name">Name.</param>
        /// <param name="value">Value.</param>
        /// <returns>SqlParameter.</returns>
        public static SqlParameter GetParameter(string name, decimal value) => new SqlParameter
        {
            ParameterName = name,
            Value = value,
            SqlDbType = SqlDbType.Decimal,
        };

        /// <summary>
        /// GetParameter.
        /// </summary>
        /// <param name="name">Name.</param>
        /// <param name="value">Value.</param>
        /// <returns>SqlParameter.</returns>
        public static SqlParameter GetParameter(string name, bool value) => new SqlParameter
        {
            ParameterName = name,
            Value = value,
            SqlDbType = SqlDbType.Bit,
        };

        /// <summary>
        /// GetParameter.
        /// </summary>
        /// <param name="name">Name.</param>
        /// <param name="value">Value.</param>
        /// <returns>SqlParameter.</returns>
        public static SqlParameter GetParameter(string name, int value) => new SqlParameter
        {
            ParameterName = name,
            Value = value,
            SqlDbType = SqlDbType.Int,
        };

        /// <summary>
        /// GetParameter.
        /// </summary>
        /// <param name="name">Name.</param>
        /// <param name="value">Value.</param>
        /// <returns>SqlParameter.</returns>
        public static SqlParameter GetParameter(string name, DateTime value) => new SqlParameter
        {
            ParameterName = name,
            Value = value,
            SqlDbType = SqlDbType.DateTime2,
        };

        /// <summary>
        /// GetParameter.
        /// </summary>
        /// <param name="name">Name.</param>
        /// <param name="value">Value.</param>
        /// <param name="typeName">Type Name.</param>
        /// <returns>SqlParameter.</returns>
        public static SqlParameter GetParameter(string name, DataTable value, string typeName = "TTListInt") => new SqlParameter
        {
            ParameterName = name,
            Value = value,
            TypeName = typeName,
        };
    }
}
