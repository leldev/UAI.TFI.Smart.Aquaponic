// --------------------------------------------------------------------
// <copyright file="PlantDal.cs" company="Smart Aquaponic">
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
    /// PlantDal.
    /// </summary>
    public class PlantDal : ICrud<Plant>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="PlantDal"/> class.
        /// </summary>
        public PlantDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(Plant entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.IsHydroponic, entity.IsHydroponic),
                SqlHelper.GetParameter(Constants.Parameters.IsLowLight, entity.IsLowLight),
            };

            return this.context.Write(Constants.StoredProcedures.CreatePlant, parameters);
        }

        /// <inheritdoc/>
        public int Delete(Plant entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.PlantId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.DeletePlant, parameters);
        }

        /// <inheritdoc/>
        public Plant Read(int id)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.PlantId, id),
            };

            var ds = this.context.Read(Constants.StoredProcedures.GetPlant, parameters);

            Plant plant = null;

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    plant = this.GetPlant(row);
                }
            }

            return plant;
        }

        /// <inheritdoc/>
        public IList<Plant> Read()
        {
            List<Plant> result = new List<Plant>();

            var ds = this.context.Read(Constants.StoredProcedures.GetPlants);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result.Add(this.GetPlant(row));
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(Plant entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.PlantId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.ModifiedDate, entity.ModifiedDate),
                SqlHelper.GetParameter(Constants.Parameters.IsHydroponic, entity.IsHydroponic),
                SqlHelper.GetParameter(Constants.Parameters.IsLowLight, entity.IsLowLight),
            };

            return this.context.Write(Constants.StoredProcedures.UpdatePlant, parameters);
        }

        private Plant GetPlant(DataRow row)
        {
            return new Plant()
            {
                CreatedDate = Convert.ToDateTime(row[nameof(Plant.CreatedDate)]),
                Id = Convert.ToInt32(row[Constants.Columns.PlantId]),
                ModifiedDate = Convert.ToDateTime(row[nameof(Plant.ModifiedDate)]),
                Name = row[nameof(Plant.Name)].ToString(),
                IsLowLight = Convert.ToBoolean(row[nameof(Plant.IsLowLight)]),
                IsHydroponic = Convert.ToBoolean(row[nameof(Plant.IsHydroponic)]),
            };
        }
    }
}
