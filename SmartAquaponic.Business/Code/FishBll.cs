// --------------------------------------------------------------------
// <copyright file="FishBll.cs" company="Smart Aquaponic">
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
    /// FishBll.
    /// </summary>
    public class FishBll : ICrud<Fish>
    {
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly FishDal mapper;

        /// <summary>
        /// Initializes a new instance of the <see cref="PermissionBll"/> class.
        /// </summary>
        public FishBll()
        {
            this.mapper = new FishDal();
        }

        public FishBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new FishDal();
        }

        /// <inheritdoc/>
        public int Create(Fish entity)
        {
            var id = this.mapper.Create(entity);

            if (id > 0)
            {
                this.LogMessage($"Fish {id} created.");
            }

            return id;
        }

        /// <inheritdoc/>
        public int Delete(Fish entity)
        {
            var id = this.mapper.Delete(entity);

            if (id > 0)
            {
                this.LogMessage($"Fish {id} deleted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public Fish Read(int id)
        {
            return this.mapper.Read(id);
        }

        /// <inheritdoc/>
        public IList<Fish> Read()
        {
            return this.mapper.Read();
        }

        /// <inheritdoc/>
        public int Update(Fish entity)
        {
            var id = this.mapper.Update(entity);

            if (id > 0)
            {
                this.LogMessage($"Fish {id} updated.");
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
