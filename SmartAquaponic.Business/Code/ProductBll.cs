// --------------------------------------------------------------------
// <copyright file="ProductBll.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Business
{
    using System;
    using System.Collections.Generic;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.DataAccess.Mappers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Domain.Enum;

    /// <summary>
    /// ProductBll.
    /// </summary>
    public class ProductBll : ICrud<Product>
    {
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly ProductDal mapper;

        /// <summary>
        /// Initializes a new instance of the <see cref="ProductBll"/> class.
        /// </summary>
        public ProductBll()
        {
            this.mapper = new ProductDal();
        }

        public ProductBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new ProductDal();
        }

        /// <inheritdoc/>
        public int Create(Product entity)
        {
            var id = this.mapper.Create(entity);

            if (id > 0)
            {
                this.LogMessage($"Product {id} created.");
            }

            return id;
        }

        /// <inheritdoc/>
        public int Delete(Product entity)
        {
            var id = this.mapper.Delete(entity);

            if (id > 0)
            {
                this.LogMessage($"Product {id} deleted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public Product Read(int id)
        {
            return this.mapper.Read(id);
        }

        /// <inheritdoc/>
        public IList<Product> Read()
        {
            return this.mapper.Read();
        }

        /// <inheritdoc/>
        public int Update(Product entity)
        {
            var id = this.mapper.Update(entity);

            if (id > 0)
            {
                this.LogMessage($"Product {id} updated.");
            }

            return id;
        }

        private void LogMessage(string message)
        {
            var log = new Log()
            {
                Event = EventType.Info,
                Ip = this.ip,
                Message = message,
                User = this.currentUser,
            };

            new LogBll().Create(log);
        }
    }
}
