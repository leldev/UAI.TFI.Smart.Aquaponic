// --------------------------------------------------------------------
// <copyright file="SpotLightBll.cs" company="Smart Aquaponic">
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
    /// SpotLightBll.
    /// </summary>
    public class SpotLightBll : ICrud<SpotLight>
    {
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly SpotLightDal mapper;

        /// <summary>
        /// Initializes a new instance of the <see cref="SpotLightBll"/> class.
        /// </summary>
        public SpotLightBll()
        {
            this.mapper = new SpotLightDal();
        }

        public SpotLightBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new SpotLightDal();
        }

        /// <inheritdoc/>
        public int Create(SpotLight entity)
        {
            var id = this.mapper.Create(entity);

            if (id > 0)
            {
                this.LogMessage($"SpotLight {id} created.");
            }

            return id;
        }

        /// <inheritdoc/>
        public int Delete(SpotLight entity)
        {
            var id = this.mapper.Delete(entity);

            if (id > 0)
            {
                this.LogMessage($"SpotLight {id} deleted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public SpotLight Read(int id)
        {
            return this.mapper.Read(id);
        }

        /// <inheritdoc/>
        public IList<SpotLight> Read()
        {
            return this.mapper.Read();
        }

        /// <inheritdoc/>
        public int Update(SpotLight entity)
        {
            var id = this.mapper.Update(entity);

            if (id > 0)
            {
                this.LogMessage($"SpotLight {id} updated.");
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
