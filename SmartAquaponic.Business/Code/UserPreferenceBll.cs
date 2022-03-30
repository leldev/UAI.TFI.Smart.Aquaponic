// --------------------------------------------------------------------
// <copyright file="UserPreferenceBll.cs" company="Smart Aquaponic">
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
    /// UserPreferenceBll.
    /// </summary>
    public class UserPreferenceBll : ICrud<UserPreference>
    {
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly UserPreferenceDal mapper;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserPreferenceBll"/> class.
        /// </summary>
        public UserPreferenceBll()
        {
            this.mapper = new UserPreferenceDal();
        }

        public UserPreferenceBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new UserPreferenceDal();
        }

        /// <inheritdoc/>
        public int Create(UserPreference entity)
        {
            var id = this.mapper.Create(entity);

            if (id > 0)
            {
                this.LogMessage($"UserPreference {id} created.");
            }

            return id;
        }

        /// <inheritdoc/>
        public int Delete(UserPreference entity)
        {
            var id = this.mapper.Delete(entity);

            if (id > 0)
            {
                this.LogMessage($"UserPreference {id} deleted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public UserPreference Read(int id)
        {
            return this.mapper.Read(id);
        }

        /// <inheritdoc/>
        public IList<UserPreference> Read()
        {
            return this.mapper.Read();
        }

        /// <inheritdoc/>
        public int Update(UserPreference entity)
        {
            var id = this.mapper.Update(entity);

            if (id > 0)
            {
                this.LogMessage($"UserPreference {id} updated.");
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
