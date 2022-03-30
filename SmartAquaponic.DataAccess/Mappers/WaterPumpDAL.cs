// --------------------------------------------------------------------
// <copyright file="WaterPumpDal.cs" company="Smart Aquaponic">
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
    /// WaterPumpDal.
    /// </summary>
    public class WaterPumpDal : ICrud<WaterPump>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="WaterPumpDal"/> class.
        /// </summary>
        public WaterPumpDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(WaterPump entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.FlowRate, entity.FlowRate),
                SqlHelper.GetParameter(Constants.Parameters.Power, entity.Power),
                SqlHelper.GetParameter(Constants.Parameters.Volume, entity.Volume),
            };

            return this.context.Write(Constants.StoredProcedures.CreateWaterPump, parameters);
        }

        /// <inheritdoc/>
        public int Delete(WaterPump entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.WaterPumpId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.DeleteWaterPump, parameters);
        }

        /// <inheritdoc/>
        public WaterPump Read(int id)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.WaterPumpId, id),
            };

            var ds = this.context.Read(Constants.StoredProcedures.GetWaterPump, parameters);

            WaterPump waterPump = null;

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    waterPump = this.GetWaterPump(row);
                }
            }

            return waterPump;
        }

        /// <inheritdoc/>
        public IList<WaterPump> Read()
        {
            List<WaterPump> result = new List<WaterPump>();

            var ds = this.context.Read(Constants.StoredProcedures.GetWaterPumps);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result.Add(this.GetWaterPump(row));
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(WaterPump entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.WaterPumpId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.ModifiedDate, entity.ModifiedDate),
                SqlHelper.GetParameter(Constants.Parameters.FlowRate, entity.FlowRate),
                SqlHelper.GetParameter(Constants.Parameters.Power, entity.Power),
                SqlHelper.GetParameter(Constants.Parameters.Volume, entity.Volume),
            };

            return this.context.Write(Constants.StoredProcedures.UpdateWaterPump, parameters);
        }

        private WaterPump GetWaterPump(DataRow row)
        {
            return new WaterPump()
            {
                CreatedDate = Convert.ToDateTime(row[nameof(WaterPump.CreatedDate)]),
                Id = Convert.ToInt32(row[Constants.Columns.WaterPumpId]),
                ModifiedDate = Convert.ToDateTime(row[nameof(WaterPump.ModifiedDate)]),
                Name = row[nameof(WaterPump.Name)].ToString(),
                Volume = Convert.ToDecimal(row[nameof(WaterPump.Volume)]),
                Power = Convert.ToInt32(row[nameof(WaterPump.Power)]),
                FlowRate = Convert.ToInt32(row[nameof(WaterPump.FlowRate)]),
            };
        }
    }
}
