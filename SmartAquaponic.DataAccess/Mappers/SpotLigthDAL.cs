// --------------------------------------------------------------------
// <copyright file="SpotLightDal.cs" company="Smart Aquaponic">
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
    /// SpotLightDal.
    /// </summary>
    public class SpotLightDal : ICrud<SpotLight>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="SpotLightDal"/> class.
        /// </summary>
        public SpotLightDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(SpotLight entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.Heigth, entity.Heigth),
                SqlHelper.GetParameter(Constants.Parameters.Length, entity.Length),
                SqlHelper.GetParameter(Constants.Parameters.Slots, entity.Slots),
                SqlHelper.GetParameter(Constants.Parameters.Width, entity.Width),
                SqlHelper.GetParameter(Constants.Parameters.SocketId, (int)entity.Socket),
                SqlHelper.GetParameter(Constants.Parameters.Lamps, SqlHelper.GetDataTableFromList(entity.Lamps)),
            };

            return this.context.Write(Constants.StoredProcedures.CreateSpotLight, parameters);
        }

        /// <inheritdoc/>
        public int Delete(SpotLight entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.SpotLightId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.DeleteSpotLight, parameters);
        }

        /// <inheritdoc/>
        public SpotLight Read(int id)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.SpotLightId, id),
            };

            var ds = this.context.Read(Constants.StoredProcedures.GetSpotLight, parameters);

            SpotLight spotLight = null;

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    if (spotLight == null)
                    {
                        spotLight = new SpotLight()
                        {
                            CreatedDate = Convert.ToDateTime(row[nameof(SpotLight.CreatedDate)]),
                            Id = Convert.ToInt32(row[Constants.Columns.SpotLightId]),
                            ModifiedDate = Convert.ToDateTime(row[nameof(SpotLight.ModifiedDate)]),
                            Name = row[nameof(SpotLight.Name)].ToString(),
                            Lamps = row.IsNull(Constants.Columns.LampId) ? new List<Lamp>() : new List<Lamp>()
                            {
                                new Lamp()
                                {
                                   Id = Convert.ToInt32(row[Constants.Columns.LampId].ToString()),
                                   Name = row[Constants.Columns.LampName].ToString(),
                                },
                            },
                            Heigth = Convert.ToDecimal(row[nameof(SpotLight.Heigth)]),
                            Length = Convert.ToDecimal(row[nameof(SpotLight.Length)]),
                            Width = Convert.ToDecimal(row[nameof(SpotLight.Width)]),
                            Slots = Convert.ToInt32(row[nameof(SpotLight.Slots)]),
                            Socket = (SocketType)Convert.ToInt32(row[Constants.Columns.SocketId]),
                        };
                    }
                    else
                    {
                        spotLight.Lamps.Add(
                            new Lamp()
                            {
                                Id = Convert.ToInt32(row[Constants.Columns.LampId].ToString()),
                                Name = row[Constants.Columns.LampName].ToString(),
                            });
                    }
                }
            }

            return spotLight;
        }

        /// <inheritdoc/>
        public IList<SpotLight> Read()
        {
            List<SpotLight> result = new List<SpotLight>();

            var ds = this.context.Read(Constants.StoredProcedures.GetSpotLights);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    var spotLightId = Convert.ToInt32(row[Constants.Columns.SpotLightId]);
                    var spotLight = result.FirstOrDefault(x => x.Id.Equals(spotLightId));

                    if (spotLight == null)
                    {
                        result.Add(
                        new SpotLight()
                        {
                            CreatedDate = Convert.ToDateTime(row[nameof(SpotLight.CreatedDate)]),
                            Id = Convert.ToInt32(row[Constants.Columns.SpotLightId]),
                            ModifiedDate = Convert.ToDateTime(row[nameof(SpotLight.ModifiedDate)]),
                            Name = row[nameof(SpotLight.Name)].ToString(),
                            Lamps = row.IsNull(Constants.Columns.LampId) ? new List<Lamp>() : new List<Lamp>()
                            {
                                new Lamp()
                                {
                                   Id = Convert.ToInt32(row[Constants.Columns.LampId].ToString()),
                                   Name = row[Constants.Columns.LampName].ToString(),
                                },
                            },
                            Heigth = Convert.ToDecimal(row[nameof(SpotLight.Heigth)]),
                            Length = Convert.ToDecimal(row[nameof(SpotLight.Length)]),
                            Width = Convert.ToDecimal(row[nameof(SpotLight.Width)]),
                            Slots = Convert.ToInt32(row[nameof(SpotLight.Slots)]),
                            Socket = (SocketType)Convert.ToInt32(row[Constants.Columns.SocketId]),
                        });
                    }
                    else
                    {
                        spotLight.Lamps.Add(
                            new Lamp()
                            {
                                Id = Convert.ToInt32(row[Constants.Columns.LampId].ToString()),
                                Name = row[Constants.Columns.LampName].ToString(),
                            });
                    }
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(SpotLight entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.SpotLightId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.ModifiedDate, entity.ModifiedDate),
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.Heigth, entity.Heigth),
                SqlHelper.GetParameter(Constants.Parameters.Length, entity.Length),
                SqlHelper.GetParameter(Constants.Parameters.Slots, entity.Slots),
                SqlHelper.GetParameter(Constants.Parameters.Width, entity.Width),
                SqlHelper.GetParameter(Constants.Parameters.SocketId, (int)entity.Socket),
                SqlHelper.GetParameter(Constants.Parameters.Lamps, SqlHelper.GetDataTableFromList(entity.Lamps)),
            };

            return this.context.Write(Constants.StoredProcedures.UpdateSpotLight, parameters);
        }
    }
}
