// --------------------------------------------------------------------
// <copyright file="DbBll.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Business
{
    using SmartAquaponic.DataAccess;
    using SmartAquaponic.DataAccess.Mappers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Domain.Enum;
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Text;

    /// <summary>
    /// DbBll.
    /// </summary>
    public class ReportBll
    {
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly ReportDal mapper;

        public ReportBll()
        {
            this.mapper = new ReportDal();
        }

        public ReportBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new ReportDal();
        }

        /// <summary>
        /// GetNotUsed.
        /// </summary>
        /// <returns>Result as list of Report.</returns>
        public List<Report> GetNotUsed()
        {
            // TODO: CU
            return this.mapper.GetNotUsed();
        }

        /// <summary>
        /// GetMostUsed.
        /// </summary>
        /// <returns>Result as list of Report.</returns>
        public List<Report> GetMostUsed()
        {
            // TODO: CU
            return this.mapper.GetMostUsed();
        }

        private void LogMessage(string message)
        {
            var log = new Log()
            {
                Event = EventType.Warning,
                Ip = this.ip,
                Message = message,
                User = this.currentUser,
            };

            new LogBll().Create(log);
        }
    }
}
