// --------------------------------------------------------------------
// <copyright file="PotBll.cs" company="Smart Aquaponic">
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
    /// PotBll.
    /// </summary>
    public class PotBll : ICrud<Pot>
    {
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly PotDal mapper;

        /// <summary>
        /// Initializes a new instance of the <see cref="PermissionBll"/> class.
        /// </summary>
        public PotBll()
        {
            this.mapper = new PotDal();
        }

        public PotBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new PotDal();
        }

        /// <inheritdoc/>
        public int Create(Pot entity)
        {
            var id = this.mapper.Create(entity);

            if (id > 0)
            {
                this.LogMessage($"Pot {id} created.");
            }

            return id;
        }

        /// <inheritdoc/>
        public int Delete(Pot entity)
        {
            var id = this.mapper.Delete(entity);

            if (id > 0)
            {
                this.LogMessage($"Pot {id} deleted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public Pot Read(int id)
        {
            return this.mapper.Read(id);
        }

        /// <inheritdoc/>
        public IList<Pot> Read()
        {
            return this.mapper.Read();
        }

        /// <inheritdoc/>
        public int Update(Pot entity)
        {
            var id = this.mapper.Update(entity);

            if (id > 0)
            {
                this.LogMessage($"Pot {id} updated.");
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
