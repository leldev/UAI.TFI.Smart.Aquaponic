// --------------------------------------------------------------------
// <copyright file="CommunicationBll.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Business
{
    using System;
    using System.Collections.Generic;
    using SmartAquaponic.Common.Helpers;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.DataAccess.Mappers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Domain.Enum;

    /// <summary>
    /// CommunicationBll.
    /// </summary>
    public class CommunicationBll : ICrud<Communication>
    {
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly CommunicationDal mapper;

        public CommunicationBll()
        {
            this.mapper = new CommunicationDal();
        }

        public CommunicationBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new CommunicationDal();
        }

        /// <inheritdoc/>
        public int Create(Communication entity)
        {
            var id = this.mapper.Create(entity);

            if (id > 0)
            {
                this.LogMessage($"Communication {id} created.");
            }

            return id;
        }

        /// <inheritdoc/>
        public int Delete(Communication entity)
        {
            var id = this.mapper.Delete(entity);

            if (id > 0)
            {
                this.LogMessage($"Communication {id} deleted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public Communication Read(int id)
        {
            return this.mapper.Read(id);
        }

        /// <inheritdoc/>
        public IList<Communication> Read()
        {
            return this.mapper.Read();
        }

        /// <inheritdoc/>
        public int Update(Communication entity)
        {
            var id = this.mapper.Update(entity);

            if (id > 0)
            {
                EmailHelper.SendEmail(entity.Email, "Welcome to Smart Aquaponic", entity.Response);

                this.LogMessage($"Communication {id} updated.");
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
