// --------------------------------------------------------------------
// <copyright file="TankDal.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.DataAccess.Mappers
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.Design;
    using System.Data;
    using System.Data.SqlClient;
    using System.Linq;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Domain.Enum;
    using Constants = SmartAquaponic.Common.Constants.DataAccessConstant;

    /// <summary>
    /// TankDal.
    /// </summary>
    public class TankDal : ICrud<Tank>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="TankDal"/> class.
        /// </summary>
        public TankDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(Tank entity)
        {
            var table = new DataTable();
            table.Columns.Add(Constants.Columns.Key, typeof(int));
            table.Columns.Add(Constants.Columns.Value, typeof(string));

            var fishIdList = new List<int>();

            foreach (var item in entity.Fishes)
            {
                var cant = 0;

                if (!fishIdList.Contains(item.Id))
                {
                    fishIdList.Add(item.Id);
                    cant = entity.Fishes.Count(x => x.Id == item.Id);

                    var row = table.NewRow();
                    row[Constants.Columns.Key] = item.Id;
                    row[Constants.Columns.Value] = cant;
                    table.Rows.Add(row);
                }
            }

            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.Heigth, entity.Heigth),
                SqlHelper.GetParameter(Constants.Parameters.Length, entity.Length),
                SqlHelper.GetParameter(Constants.Parameters.Width, entity.Width),
                SqlHelper.GetParameter(Constants.Parameters.WaterTemp, entity.WaterTemp),
                SqlHelper.GetParameter(Constants.Parameters.WaterPumpId, entity.WaterPump.Id),
                SqlHelper.GetParameter(Constants.Parameters.PhId, (int)entity.Ph),
                SqlHelper.GetParameter(Constants.Parameters.Decors, SqlHelper.GetDataTableFromList(entity.Decors)),
                SqlHelper.GetParameter(Constants.Parameters.Fishes, table, "TTDictionary"),
            };

            return this.context.Write(Constants.StoredProcedures.CreateTank, parameters);
        }

        /// <inheritdoc/>
        public int Delete(Tank entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.TankId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.DeleteTank, parameters);
        }

        /// <inheritdoc/>
        public Tank Read(int id)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.TankId, id),
            };

            var ds = this.context.Read(Constants.StoredProcedures.GetTank, parameters);

            Tank tank = null;

            for (int i = 0; i < ds.Tables.Count; i++)
            {
                if (i == 0)
                {
                    foreach (DataRow row in ds.Tables[i].Rows)
                    {
                        tank = this.GetTank(row);
                    }
                }

                if (i == 1)
                {
                    foreach (DataRow row in ds.Tables[i].Rows)
                    {
                        var cant = Convert.ToInt32(row[Constants.Columns.Cant]);

                        for (int x = 0; x < cant; x++)
                        {
                            tank.Fishes.Add(this.GetFish(row));
                        }
                    }
                }

                if (i == 2)
                {
                    foreach (DataRow row in ds.Tables[i].Rows)
                    {
                        tank.Decors.Add(this.GetDecor(row));
                    }
                }
            }

            return tank;
        }

        /// <inheritdoc/>
        public IList<Tank> Read()
        {
            List<Tank> result = new List<Tank>();

            var ds = this.context.Read(Constants.StoredProcedures.GetTanks);

            for (int i = 0; i < ds.Tables.Count; i++)
            {
                if (i == 0)
                {
                    foreach (DataRow row in ds.Tables[i].Rows)
                    {
                        result.Add(this.GetTank(row));
                    }
                }

                if (i == 1)
                {
                    foreach (DataRow row in ds.Tables[i].Rows)
                    {
                        var tankId = Convert.ToInt32(row[Constants.Columns.TankId]);
                        var tank = result.FirstOrDefault(x => x.Id.Equals(tankId));

                        var cant = Convert.ToInt32(row[Constants.Columns.Cant]);

                        for (int x = 0; x < cant; x++)
                        {
                            tank.Fishes.Add(this.GetFish(row));
                        }

                    }
                }

                if (i == 2)
                {
                    foreach (DataRow row in ds.Tables[i].Rows)
                    {
                        var tankId = Convert.ToInt32(row[Constants.Columns.TankId]);
                        var tank = result.FirstOrDefault(x => x.Id.Equals(tankId));

                        tank.Decors.Add(this.GetDecor(row));
                    }
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(Tank entity)
        {
            var table = new DataTable();
            table.Columns.Add(Constants.Columns.Key, typeof(int));
            table.Columns.Add(Constants.Columns.Value, typeof(string));

            var fishIdList = new List<int>();

            foreach (var item in entity.Fishes)
            {
                var cant = 0;

                if (!fishIdList.Contains(item.Id))
                {
                    fishIdList.Add(item.Id);
                    cant = entity.Fishes.Count(x => x.Id == item.Id);

                    var row = table.NewRow();
                    row[Constants.Columns.Key] = item.Id;
                    row[Constants.Columns.Value] = cant;
                    table.Rows.Add(row);
                }
            }

            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.TankId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.ModifiedDate, entity.ModifiedDate),
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.Heigth, entity.Heigth),
                SqlHelper.GetParameter(Constants.Parameters.Length, entity.Length),
                SqlHelper.GetParameter(Constants.Parameters.WaterTemp, entity.WaterTemp),
                SqlHelper.GetParameter(Constants.Parameters.Width, entity.Width),
                SqlHelper.GetParameter(Constants.Parameters.WaterPumpId, entity.WaterPump.Id),
                SqlHelper.GetParameter(Constants.Parameters.PhId, (int)entity.Ph),
                SqlHelper.GetParameter(Constants.Parameters.Decors, SqlHelper.GetDataTableFromList(entity.Decors)),
                SqlHelper.GetParameter(Constants.Parameters.Fishes, table, "TTDictionary"),
            };

            return this.context.Write(Constants.StoredProcedures.UpdateTank, parameters);
        }

        private Fish GetFish(DataRow row)
        {
            return new Fish()
            {
                Id = Convert.ToInt32(row[Constants.Columns.FishId]),
                Name = row[nameof(Fish.Name)].ToString(),
            };
        }

        private Decor GetDecor(DataRow row)
        {
            return new Decor()
            {
                Id = Convert.ToInt32(row[Constants.Columns.DecorId]),
                Name = row[nameof(Decor.Name)].ToString(),
            };
        }

        private Tank GetTank(DataRow row)
        {
            return new Tank()
            {
                CreatedDate = Convert.ToDateTime(row[nameof(Tank.CreatedDate)]),
                Id = Convert.ToInt32(row[Constants.Columns.TankId]),
                ModifiedDate = Convert.ToDateTime(row[nameof(Tank.ModifiedDate)]),
                Name = row[nameof(Tank.Name)].ToString(),
                Heigth = Convert.ToDecimal(row[nameof(Tank.Heigth)]),
                Length = Convert.ToDecimal(row[nameof(Tank.Length)]),
                Width = Convert.ToDecimal(row[nameof(Tank.Width)]),
                WaterTemp = Convert.ToDecimal(row[nameof(Tank.WaterTemp)]),
                WaterPump = new WaterPump()
                {
                    Id = Convert.ToInt32(row[Constants.Columns.WaterPumpId].ToString()),
                    Name = row[Constants.Columns.WaterPumpName].ToString(),
                },
                Ph = (PhType)Convert.ToInt32(row[Constants.Columns.PhId]),
                Fishes = new List<Fish>(),
                Decors = new List<Decor>(),
            };
        }
    }
}
