// --------------------------------------------------------------------
// <copyright file="DbDal.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.DataAccess.Mappers
{
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.Domain;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using Constants = SmartAquaponic.Common.Constants.DataAccessConstant;

    /// <summary>
    /// DbDal.
    /// </summary>
    public class ReportDal
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="DbDal"/> class.
        /// </summary>
        public ReportDal()
        {
            this.context = new AccessSql();
        }

        /// <summary>
        /// GetNotUsed.
        /// </summary>
        /// <returns>Result as list of Report.</returns>
        public List<Report> GetNotUsed()
        {
            var result = new List<Report>();

            var ds = this.context.Read(Constants.StoredProcedures.ReportNotUsed);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result.Add(new Report()
                    {
                        Id = Convert.ToInt32(row[nameof(IEntity.Id)]),
                        Name = row[nameof(Report.Name)].ToString(),
                        Type = row[nameof(Report.Type)].ToString(),
                    });
                }
            }

            return result;
        }

        /// <summary>
        /// GetMostUsed.
        /// </summary>
        /// <returns>Result as list of Report.</returns>
        public List<Report> GetMostUsed()
        {
            var result = new List<Report>();

            var ds = this.context.Read(Constants.StoredProcedures.ReportMostUsed);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result.Add(new Report()
                    {
                        Id = Convert.ToInt32(row[nameof(IEntity.Id)]),
                        Name = row[nameof(Report.Name)].ToString(),
                        Type = row[nameof(Report.Type)].ToString(),
                        Cant = Convert.ToInt32(row[nameof(Report.Cant)]),
                    });
                }
            }

            return result;
        }
    }
}
