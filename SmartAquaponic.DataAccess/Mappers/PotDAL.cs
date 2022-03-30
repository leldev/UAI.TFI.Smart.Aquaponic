// --------------------------------------------------------------------
// <copyright file="PotDal.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.DataAccess.Mappers
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Linq;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Domain.Enum;
    using Constants = SmartAquaponic.Common.Constants.DataAccessConstant;

    /// <summary>
    /// PotDal.
    /// </summary>
    public class PotDal : ICrud<Pot>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="PotDal"/> class.
        /// </summary>
        public PotDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(Pot entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.Heigth, entity.Heigth),
                SqlHelper.GetParameter(Constants.Parameters.Length, entity.Length),
                SqlHelper.GetParameter(Constants.Parameters.Rgb, entity.Rgb),
                SqlHelper.GetParameter(Constants.Parameters.Width, entity.Width),
                SqlHelper.GetParameter(Constants.Parameters.RockId, (int)entity.Rock),
                SqlHelper.GetParameter(Constants.Parameters.Plants, SqlHelper.GetDataTableFromList(entity.Plants)),
            };

            return this.context.Write(Constants.StoredProcedures.CreatePot, parameters);
        }

        /// <inheritdoc/>
        public int Delete(Pot entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.PotId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.DeletePot, parameters);
        }

        /// <inheritdoc/>
        public Pot Read(int id)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.PotId, id),
            };

            var ds = this.context.Read(Constants.StoredProcedures.GetPot, parameters);

            Pot pot = null;

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    if (pot == null)
                    {
                        pot = new Pot()
                        {
                            CreatedDate = Convert.ToDateTime(row[nameof(Pot.CreatedDate)]),
                            Id = Convert.ToInt32(row[Constants.Columns.PotId]),
                            ModifiedDate = Convert.ToDateTime(row[nameof(Pot.ModifiedDate)]),
                            Name = row[nameof(Pot.Name)].ToString(),
                            Rgb = row[nameof(Pot.Rgb)].ToString(),
                            Plants = row.IsNull(Constants.Columns.PlantId) ? new List<Plant>() : new List<Plant>()
                            {
                                new Plant()
                                {
                                   Id = Convert.ToInt32(row[Constants.Columns.PlantId].ToString()),
                                   Name = row[Constants.Columns.PlantName].ToString(),
                                   IsHydroponic = Convert.ToBoolean(row[nameof(Plant.IsHydroponic)]),
                                   IsLowLight = Convert.ToBoolean(row[nameof(Plant.IsLowLight)]),
                                },
                            },
                            Heigth = Convert.ToDecimal(row[nameof(Pot.Heigth)]),
                            Length = Convert.ToDecimal(row[nameof(Pot.Length)]),
                            Width = Convert.ToDecimal(row[nameof(Pot.Width)]),
                            Rock = (RockType)Convert.ToInt32(row[Constants.Columns.RockId]),
                        };
                    }
                    else
                    {
                        pot.Plants.Add(
                            new Plant()
                            {
                                Id = Convert.ToInt32(row[Constants.Columns.PlantId].ToString()),
                                Name = row[Constants.Columns.PlantName].ToString(),
                                IsHydroponic = Convert.ToBoolean(row[nameof(Plant.IsHydroponic)]),
                                IsLowLight = Convert.ToBoolean(row[nameof(Plant.IsLowLight)]),
                            });
                    }
                }
            }

            return pot;
        }

        /// <inheritdoc/>
        public IList<Pot> Read()
        {
            List<Pot> result = new List<Pot>();

            var ds = this.context.Read(Constants.StoredProcedures.GetPots);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    var potId = Convert.ToInt32(row[Constants.Columns.PotId]);
                    var pot = result.FirstOrDefault(x => x.Id.Equals(potId));

                    if (pot == null)
                    {
                        result.Add(
                        new Pot()
                        {
                            CreatedDate = Convert.ToDateTime(row[nameof(Pot.CreatedDate)]),
                            Id = Convert.ToInt32(row[Constants.Columns.PotId]),
                            ModifiedDate = Convert.ToDateTime(row[nameof(Pot.ModifiedDate)]),
                            Name = row[nameof(Pot.Name)].ToString(),
                            Rgb = row[nameof(Pot.Rgb)].ToString(),
                            Plants = row.IsNull(Constants.Columns.PlantId) ? new List<Plant>() : new List<Plant>()
                            {
                                new Plant()
                                {
                                   Id = Convert.ToInt32(row[Constants.Columns.PlantId].ToString()),
                                   Name = row[Constants.Columns.PlantName].ToString(),
                                   IsHydroponic = Convert.ToBoolean(row[nameof(Plant.IsHydroponic)]),
                                   IsLowLight = Convert.ToBoolean(row[nameof(Plant.IsLowLight)]),
                                },
                            },
                            Heigth = Convert.ToDecimal(row[nameof(Pot.Heigth)]),
                            Length = Convert.ToDecimal(row[nameof(Pot.Length)]),
                            Width = Convert.ToDecimal(row[nameof(Pot.Width)]),
                            Rock = (RockType)Convert.ToInt32(row[Constants.Columns.RockId]),
                        });
                    }
                    else
                    {
                        pot.Plants.Add(
                            new Plant()
                            {
                                Id = Convert.ToInt32(row[Constants.Columns.PlantId].ToString()),
                                Name = row[Constants.Columns.PlantName].ToString(),
                                IsHydroponic = Convert.ToBoolean(row[nameof(Plant.IsHydroponic)]),
                                IsLowLight = Convert.ToBoolean(row[nameof(Plant.IsLowLight)]),
                            });
                    }
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(Pot entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.PotId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.ModifiedDate, entity.ModifiedDate),
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.Heigth, entity.Heigth),
                SqlHelper.GetParameter(Constants.Parameters.Length, entity.Length),
                SqlHelper.GetParameter(Constants.Parameters.Rgb, entity.Rgb),
                SqlHelper.GetParameter(Constants.Parameters.Width, entity.Width),
                SqlHelper.GetParameter(Constants.Parameters.RockId, (int)entity.Rock),
                SqlHelper.GetParameter(Constants.Parameters.Plants, SqlHelper.GetDataTableFromList(entity.Plants)),
            };

            return this.context.Write(Constants.StoredProcedures.UpdatePot, parameters);
        }
    }
}
