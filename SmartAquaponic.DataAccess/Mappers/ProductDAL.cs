// --------------------------------------------------------------------
// <copyright file="ProductDal.cs" company="Smart Aquaponic">
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
    /// ProductDAL.
    /// </summary>
    public class ProductDal : ICrud<Product>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="ProductDal"/> class.
        /// </summary>
        public ProductDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(Product entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.PotId, entity.Pot.Id),
                SqlHelper.GetParameter(Constants.Parameters.TankId, entity.Tank.Id),
            };

            if (entity.SpotLight != null)
            {
                parameters.Add(SqlHelper.GetParameter(Constants.Parameters.SpotLightId, entity.SpotLight.Id));
            }

            return this.context.Write(Constants.StoredProcedures.CreateProduct, parameters);
        }

        /// <inheritdoc/>
        public int Delete(Product entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.ProductId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.DeleteProduct, parameters);
        }

        /// <inheritdoc/>
        public Product Read(int id)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.ProductId, id),
            };

            var ds = this.context.Read(Constants.StoredProcedures.GetProduct, parameters);

            Product item = null;

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    item = this.GetProduct(row);
                }
            }

            return item;
        }

        /// <inheritdoc/>
        public IList<Product> Read()
        {
            List<Product> result = new List<Product>();

            var ds = this.context.Read(Constants.StoredProcedures.GetProducts);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result.Add(this.GetProduct(row));
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(Product entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.ProductId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.ModifiedDate, entity.ModifiedDate),
                SqlHelper.GetParameter(Constants.Parameters.PotId, entity.Pot.Id),
                SqlHelper.GetParameter(Constants.Parameters.TankId, entity.Tank.Id),
            };

            if (entity.SpotLight != null)
            {
                parameters.Add(SqlHelper.GetParameter(Constants.Parameters.SpotLightId, entity.SpotLight.Id));
            }

            return this.context.Write(Constants.StoredProcedures.UpdateProduct, parameters);
        }

        private Product GetProduct(DataRow row)
        {
            return new Product()
            {
                CreatedDate = Convert.ToDateTime(row[nameof(Product.CreatedDate)]),
                Id = Convert.ToInt32(row[Constants.Columns.ProductId]),
                ModifiedDate = Convert.ToDateTime(row[nameof(Product.ModifiedDate)]),
                Name = row[nameof(Product.Name)].ToString(),
                Pot = new Pot()
                {
                    Id = Convert.ToInt32(row[Constants.Columns.PotId]),
                    Name = row[Constants.Columns.PotName].ToString(),
                },
                Tank = new Tank()
                {
                    Id = Convert.ToInt32(row[Constants.Columns.TankId]),
                    Name = row[Constants.Columns.TankName].ToString(),
                },
                SpotLight = row.IsNull(Constants.Columns.SpotLightId) ? null : new SpotLight()
                {
                    Id = Convert.ToInt32(row[Constants.Columns.SpotLightId]),
                    Name = row[Constants.Columns.SpotLightName].ToString(),
                }
            };
        }
    }
}
