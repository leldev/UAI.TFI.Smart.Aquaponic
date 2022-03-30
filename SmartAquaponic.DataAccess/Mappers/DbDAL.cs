// --------------------------------------------------------------------
// <copyright file="DbDal.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.DataAccess.Mappers
{
    using System;
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using Constants = SmartAquaponic.Common.Constants.DataAccessConstant;

    /// <summary>
    /// DbDal.
    /// </summary>
    public class DbDal
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="DbDal"/> class.
        /// </summary>
        public DbDal()
        {
            this.context = new AccessSql();
        }

        /// <summary>
        /// Backup.
        /// </summary>
        /// <param name="fileName">File name.</param>
        /// <returns>Result as int.</returns>
        public int Backup(string fileName)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Disk, fileName),
            };

            return this.context.Write(Constants.StoredProcedures.Backup, parameters);
        }

        /// <summary>
        /// Restore.
        /// </summary>
        /// <param name="fileName">File name.</param>
        /// <returns>Result as int.</returns>
        public int Restore(string fileName)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Disk, fileName),
            };

            this.context.UseMaster = true;

            return this.context.Write(Constants.StoredProcedures.Restore, parameters);
        }
    }
}
