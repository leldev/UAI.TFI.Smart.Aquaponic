// --------------------------------------------------------------------
// <copyright file="DecorBll.cs" company="Smart Aquaponic">
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
    /// DecorBll.
    /// </summary>
    public class DecorBll : ICrud<Decor>
    {
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly DecorDal mapper;

        /// <summary>
        /// Initializes a new instance of the <see cref="PermissionBll"/> class.
        /// </summary>
        public DecorBll()
        {
            this.mapper = new DecorDal();
        }

        public DecorBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new DecorDal();
        }

        /// <inheritdoc/>
        public int Create(Decor entity)
        {
            var id = this.mapper.Create(entity);

            if (id > 0)
            {
                this.LogMessage($"Decor {id} created.");
            }

            return id;
        }

        /// <inheritdoc/>
        public int Delete(Decor entity)
        {
            var id = this.mapper.Delete(entity);

            if (id > 0)
            {
                this.LogMessage($"Decor {id} deleted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public Decor Read(int id)
        {
            return this.mapper.Read(id);
        }

        /// <inheritdoc/>
        public IList<Decor> Read()
        {
            return this.mapper.Read();
        }

        /// <inheritdoc/>
        public int Update(Decor entity)
        {
            var id = this.mapper.Update(entity);

            if (id > 0)
            {
                this.LogMessage($"Decor {id} updated.");
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
