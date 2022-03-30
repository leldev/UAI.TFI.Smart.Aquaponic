// --------------------------------------------------------------------
// <copyright file="LampDal.cs" company="Smart Aquaponic">
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
    using SmartAquaponic.Domain.Enum;
    using Constants = SmartAquaponic.Common.Constants.DataAccessConstant;

    /// <summary>
    /// LampDal.
    /// </summary>
    public class LampDal : ICrud<Lamp>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="LampDal"/> class.
        /// </summary>
        public LampDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(Lamp entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.Lumen, entity.Lumen),
                SqlHelper.GetParameter(Constants.Parameters.Power, entity.Power),
                SqlHelper.GetParameter(Constants.Parameters.SocketId, (int)entity.Socket),
            };

            return this.context.Write(Constants.StoredProcedures.CreateLamp, parameters);
        }

        /// <inheritdoc/>
        public int Delete(Lamp entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.LampId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.DeleteLamp, parameters);
        }

        /// <inheritdoc/>
        public Lamp Read(int id)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.LampId, id),
            };

            var ds = this.context.Read(Constants.StoredProcedures.GetLamp, parameters);

            Lamp lamp = null;

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    lamp = this.GetLamp(row);
                }
            }

            return lamp;
        }

        /// <inheritdoc/>
        public IList<Lamp> Read()
        {
            List<Lamp> result = new List<Lamp>();

            var ds = this.context.Read(Constants.StoredProcedures.GetLamps);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result.Add(this.GetLamp(row));
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(Lamp entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.Lumen, entity.Lumen),
                SqlHelper.GetParameter(Constants.Parameters.Power, entity.Power),
                SqlHelper.GetParameter(Constants.Parameters.SocketId, (int)entity.Socket),
                SqlHelper.GetParameter(Constants.Parameters.LampId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.ModifiedDate, entity.ModifiedDate),
            };

            return this.context.Write(Constants.StoredProcedures.UpdateLamp, parameters);
        }

        private Lamp GetLamp(DataRow row)
        {
            return new Lamp()
            {
                CreatedDate = Convert.ToDateTime(row[nameof(Lamp.CreatedDate)]),
                Id = Convert.ToInt32(row[Constants.Columns.LampId]),
                ModifiedDate = Convert.ToDateTime(row[nameof(Lamp.ModifiedDate)]),
                Name = row[nameof(Lamp.Name)].ToString(),
                Lumen = Convert.ToInt32(row[nameof(Lamp.Lumen)]),
                Power = Convert.ToInt32(row[nameof(Lamp.Power)]),
                Socket = (SocketType)Convert.ToInt32(row[Constants.Columns.SocketId]),
            };
        }
    }
}
