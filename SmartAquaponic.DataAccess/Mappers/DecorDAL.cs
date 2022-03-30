// --------------------------------------------------------------------
// <copyright file="DecorDal.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.DataAccess.Mappers
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.Domain;
    using Constants = SmartAquaponic.Common.Constants.DataAccessConstant;

    /// <summary>
    /// DecorDal.
    /// </summary>
    public class DecorDal : ICrud<Decor>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="DecorDal"/> class.
        /// </summary>
        public DecorDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(Decor entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.Type, entity.Type),
                SqlHelper.GetParameter(Constants.Parameters.Volume, entity.Volume),
            };

            return this.context.Write(Constants.StoredProcedures.CreateDecor, parameters);
        }

        /// <inheritdoc/>
        public int Delete(Decor entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.DecorId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.DeleteDecor, parameters);
        }

        /// <inheritdoc/>
        public Decor Read(int id)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.DecorId, id),
            };

            var ds = this.context.Read(Constants.StoredProcedures.GetDecor, parameters);

            Decor decor = null;

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    decor = this.GetDecor(row);
                }
            }

            return decor;
        }

        /// <inheritdoc/>
        public IList<Decor> Read()
        {
            List<Decor> result = new List<Decor>();

            var ds = this.context.Read(Constants.StoredProcedures.GetDecors);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result.Add(this.GetDecor(row));
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(Decor entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.DecorId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.ModifiedDate, entity.ModifiedDate),
                SqlHelper.GetParameter(Constants.Parameters.Type, entity.Type),
                SqlHelper.GetParameter(Constants.Parameters.Volume, entity.Volume),
            };

            return this.context.Write(Constants.StoredProcedures.UpdateDecor, parameters);
        }

        private Decor GetDecor(DataRow row)
        {
            return new Decor()
            {
                CreatedDate = Convert.ToDateTime(row[nameof(Decor.CreatedDate)]),
                Id = Convert.ToInt32(row[Constants.Columns.DecorId]),
                ModifiedDate = Convert.ToDateTime(row[nameof(Decor.ModifiedDate)]),
                Name = row[nameof(Decor.Name)].ToString(),
                Type = row[nameof(Decor.Type)].ToString(),
                Volume = Convert.ToDecimal(row[nameof(Decor.Volume)]),
            };
        }
    }
}
