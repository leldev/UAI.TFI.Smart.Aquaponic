// --------------------------------------------------------------------
// <copyright file="FishDal.cs" company="Smart Aquaponic">
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
    /// FishDal.
    /// </summary>
    public class FishDal : ICrud<Fish>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="FishDal"/> class.
        /// </summary>
        public FishDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(Fish entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.IsLonely, entity.IsLonely),
                SqlHelper.GetParameter(Constants.Parameters.WaterRequired, entity.WaterRequired),
                SqlHelper.GetParameter(Constants.Parameters.Size, entity.Size),
                SqlHelper.GetParameter(Constants.Parameters.Temp, entity.Temp),
                SqlHelper.GetParameter(Constants.Parameters.PhId, (int)entity.Ph),
                SqlHelper.GetParameter(Constants.Parameters.Predators, SqlHelper.GetDataTableFromList(entity.Predators)),
            };

            return this.context.Write(Constants.StoredProcedures.CreateFish, parameters);
        }

        /// <inheritdoc/>
        public int Delete(Fish entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.FishId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.DeleteFish, parameters);
        }

        /// <inheritdoc/>
        public Fish Read(int id)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.FishId, id),
            };

            var ds = this.context.Read(Constants.StoredProcedures.GetFish, parameters);

            Fish fish = null;

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    if (fish == null)
                    {
                        fish = new Fish()
                        {
                            CreatedDate = Convert.ToDateTime(row[nameof(Fish.CreatedDate)]),
                            Id = Convert.ToInt32(row[Constants.Columns.FishId]),
                            ModifiedDate = Convert.ToDateTime(row[nameof(Fish.ModifiedDate)]),
                            Name = row[nameof(Fish.Name)].ToString(),
                            Predators = row.IsNull(Constants.Columns.PredatorId) ? new List<Fish>() : new List<Fish>()
                            {
                                new Fish()
                                {
                                   Id = Convert.ToInt32(row[Constants.Columns.PredatorId].ToString()),
                                   Name = row[Constants.Columns.PredatorName].ToString(),
                                },
                            },
                            Size = Convert.ToDecimal(row[nameof(Fish.Size)]),
                            Temp = Convert.ToInt32(row[nameof(Fish.Temp)]),
                            WaterRequired = Convert.ToInt32(row[nameof(Fish.WaterRequired)]),
                            IsLonely = Convert.ToBoolean(row[nameof(Fish.IsLonely)]),
                            Ph = (PhType)Convert.ToInt32(row[Constants.Columns.PhId]),
                        };
                    }
                    else
                    {
                        fish.Predators.Add(
                            new Fish()
                            {
                                Id = Convert.ToInt32(row[Constants.Columns.PredatorId].ToString()),
                                Name = row[Constants.Columns.PredatorName].ToString(),
                            });
                    }
                }
            }

            return fish;
        }

        /// <inheritdoc/>
        public IList<Fish> Read()
        {
            List<Fish> result = new List<Fish>();

            var ds = this.context.Read(Constants.StoredProcedures.GetFishes);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    var fishId = Convert.ToInt32(row[Constants.Columns.FishId]);
                    var fish = result.FirstOrDefault(x => x.Id.Equals(fishId));

                    if (fish == null)
                    {
                        result.Add(
                        new Fish()
                        {
                            CreatedDate = Convert.ToDateTime(row[nameof(Fish.CreatedDate)]),
                            Id = Convert.ToInt32(row[Constants.Columns.FishId]),
                            ModifiedDate = Convert.ToDateTime(row[nameof(Fish.ModifiedDate)]),
                            Name = row[nameof(Fish.Name)].ToString(),
                            Predators = row.IsNull(Constants.Columns.PredatorId) ? new List<Fish>() : new List<Fish>()
                            {
                                new Fish()
                                {
                                   Id = Convert.ToInt32(row[Constants.Columns.PredatorId].ToString()),
                                   Name = row[Constants.Columns.PredatorName].ToString(),
                                },
                            },
                            Size = Convert.ToDecimal(row[nameof(Fish.Size)]),
                            Temp = Convert.ToInt32(row[nameof(Fish.Temp)]),
                            WaterRequired = Convert.ToInt32(row[nameof(Fish.WaterRequired)]),
                            IsLonely = Convert.ToBoolean(row[nameof(Fish.IsLonely)]),
                            Ph = (PhType)Convert.ToInt32(row[Constants.Columns.PhId]),
                        });
                    }
                    else
                    {
                        fish.Predators.Add(
                            new Fish()
                            {
                                Id = Convert.ToInt32(row[Constants.Columns.PredatorId].ToString()),
                                Name = row[Constants.Columns.PredatorName].ToString(),
                            });
                    }
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(Fish entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.FishId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.ModifiedDate, entity.ModifiedDate),
                SqlHelper.GetParameter(Constants.Parameters.IsLonely, entity.IsLonely),
                SqlHelper.GetParameter(Constants.Parameters.WaterRequired, entity.WaterRequired),
                SqlHelper.GetParameter(Constants.Parameters.Size, entity.Size),
                SqlHelper.GetParameter(Constants.Parameters.Temp, entity.Temp),
                SqlHelper.GetParameter(Constants.Parameters.PhId, (int)entity.Ph),
                SqlHelper.GetParameter(Constants.Parameters.Predators, SqlHelper.GetDataTableFromList(entity.Predators)),
            };

            return this.context.Write(Constants.StoredProcedures.UpdateFish, parameters);
        }
    }
}
