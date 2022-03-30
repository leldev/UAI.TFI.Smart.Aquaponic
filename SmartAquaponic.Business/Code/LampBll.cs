// --------------------------------------------------------------------
// <copyright file="LampBll.cs" company="Smart Aquaponic">
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
    /// LampBll.
    /// </summary>
    public class LampBll : ICrud<Lamp>
    {
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly LampDal mapper;

        /// <summary>
        /// Initializes a new instance of the <see cref="LampBll"/> class.
        /// </summary>
        public LampBll()
        {
            this.mapper = new LampDal();
        }

        public LampBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new LampDal();
        }

        /// <inheritdoc/>
        public int Create(Lamp entity)
        {
            var id = this.mapper.Create(entity);

            if (id > 0)
            {
                this.LogMessage($"Lamp {id} created.");
            }

            return id;
        }

        /// <inheritdoc/>
        public int Delete(Lamp entity)
        {
            var id = this.mapper.Delete(entity);

            if (id > 0)
            {
                this.LogMessage($"Lamp {id} deleted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public Lamp Read(int id)
        {
            return this.mapper.Read(id);
        }

        /// <inheritdoc/>
        public IList<Lamp> Read()
        {
            return this.mapper.Read();
        }

        /// <inheritdoc/>
        public int Update(Lamp entity)
        {
            var id = this.mapper.Update(entity);

            if (id > 0)
            {
                this.LogMessage($"Lamp {id} updated.");
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
