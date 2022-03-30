// --------------------------------------------------------------------
// <copyright file="LogBll.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Business
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.DataAccess.Mappers;
    using SmartAquaponic.Domain;

    /// <summary>
    /// LogBll.
    /// </summary>
    public class LogBll : ICrud<Log>
    {
        private readonly LogDal mapper;
        private readonly CryptographyBll cryptographyBll;
        private readonly string[] localIp = {"::1", "127.0 0.1"};
        private readonly string localHost = "localhost";


        /// <summary>
        /// Initializes a new instance of the <see cref="LogBll"/> class.
        /// </summary>
        public LogBll()
        {
            this.mapper = new LogDal();
            this.cryptographyBll = new CryptographyBll();
        }

        /// <inheritdoc/>
        public int Create(Log entity)
        {
            entity.Message = this.cryptographyBll.Encrypt(entity.Message);

            if (this.localIp.Contains(entity.Ip)) {
                entity.Ip = this.localHost;
            }

            var id = this.mapper.Create(entity);
            entity.Id = id;

            new ChecksumBll().Update(entity);

            return id;
        }

        /// <inheritdoc/>
        public IList<Log> Read()
        {
            var logs = this.mapper.Read().ToList();

            logs.ForEach((log) =>
            {
                log.Message = this.cryptographyBll.Decrypt(log.Message);
            });

            return logs;
        }

        /// <inheritdoc/>
        public int Delete(Log entity)
        {
            throw new NotImplementedException();
        }

        /// <inheritdoc/>
        public Log Read(int id)
        {
            throw new NotImplementedException();
        }

        /// <inheritdoc/>
        public int Update(Log entity)
        {
            throw new NotImplementedException();
        }
    }
}
