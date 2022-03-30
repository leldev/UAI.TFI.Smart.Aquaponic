// --------------------------------------------------------------------
// <copyright file="PlantBll.cs" company="Smart Aquaponic">
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
    /// PlantBll.
    /// </summary>
    public class PlantBll : ICrud<Plant>
    {
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly PlantDal mapper;

        /// <summary>
        /// Initializes a new instance of the <see cref="PlantBll"/> class.
        /// </summary>
        public PlantBll()
        {
            this.mapper = new PlantDal();
        }

        public PlantBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new PlantDal();
        }

        /// <inheritdoc/>
        public int Create(Plant entity)
        {
            var id = this.mapper.Create(entity);

            if (id > 0)
            {
                this.LogMessage($"Plant {id} created.");
            }

            return id;
        }

        /// <inheritdoc/>
        public int Delete(Plant entity)
        {
            var id = this.mapper.Delete(entity);

            if (id > 0)
            {
                this.LogMessage($"Plant {id} deleted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public Plant Read(int id)
        {
            return this.mapper.Read(id);
        }

        /// <inheritdoc/>
        public IList<Plant> Read()
        {
            return this.mapper.Read();
        }

        /// <inheritdoc/>
        public int Update(Plant entity)
        {
            var id = this.mapper.Update(entity);

            if (id > 0)
            {
                this.LogMessage($"Plant {id} updated.");
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
