// --------------------------------------------------------------------
// <copyright file="WaterPumpBll.cs" company="Smart Aquaponic">
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
    /// WaterPumpBll.
    /// </summary>
    public class WaterPumpBll : ICrud<WaterPump>
    {
        /// <inheritdoc/>
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly WaterPumpDal mapper;

        /// <summary>
        /// Initializes a new instance of the <see cref="PermissionBll"/> class.
        /// </summary>
        public WaterPumpBll()
        {
            this.mapper = new WaterPumpDal();
        }

        public WaterPumpBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new WaterPumpDal();
        }

        /// <inheritdoc/>
        public int Create(WaterPump entity)
        {
            var id = this.mapper.Create(entity);

            if (id > 0)
            {
                this.LogMessage($"WaterPump {id} created.");
            }

            return id;
        }

        /// <inheritdoc/>
        public int Delete(WaterPump entity)
        {
            var id = this.mapper.Delete(entity);

            if (id > 0)
            {
                this.LogMessage($"WaterPump {id} deleted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public WaterPump Read(int id)
        {
            return this.mapper.Read(id);
        }

        /// <inheritdoc/>
        public IList<WaterPump> Read()
        {
            return this.mapper.Read();
        }

        /// <inheritdoc/>
        public int Update(WaterPump entity)
        {
            var id = this.mapper.Update(entity);

            if (id > 0)
            {
                this.LogMessage($"WaterPump {id} updated.");
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
