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
    using System.IO;
    using System.Text;

    /// <summary>
    /// DbBll.
    /// </summary>
    public class DbBll
    {
        private readonly string backupExt = "sabak";
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly DbDal mapper;

        public DbBll()
        {
            this.mapper = new DbDal();
        }

        public DbBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new DbDal();
        }

        /// <summary>
        /// Backup.
        /// </summary>
        /// <param name="path">Path.</param>
        /// <param name="volumes">Volumes.</param>
        /// <returns>Result as int.</returns>
        public int Backup(string path, int volumes)
        {
            // TODO: CU
            var id = this.mapper.Backup(GetToDisk(path, volumes));

            if (id > 0)
            {
                this.LogMessage($"Backup {path}.");
            }

            return id;
        }

        /// <summary>
        /// Restore.
        /// </summary>
        /// <param name="path">Path.</param>
        /// <returns>Result as int.</returns>
        public int Restore(string path)
        {
            // TODO: CU
            var id = this.mapper.Restore(FindToDisk(path));

            if (id > 0)
            {
                this.LogMessage($"Restore {path}.");
            }

            return id;
        }

        private string FindToDisk(string file)
        {
            string disk = "DISK = N'{0}'";
            var result = new StringBuilder();
            
            result.AppendFormat(disk, file);
            
            for (int i = 1; i < 21; i++)
            {
                if (File.Exists(file + i))
                {
                    result.Append($", {string.Format(disk, file + i)}");
                }
            }

            return result.ToString();
        }

        private string GetToDisk(string fileName, int volume)
        {
            string disk = "DISK = '{0}.{1}'";
            var result = new StringBuilder();

            result.AppendFormat(disk, fileName, this.backupExt);

            if (volume > 1)
            {
                for (int i = 1; i < volume; i++)
                {
                    result.Append($", {string.Format(disk, fileName, this.backupExt + i)}");
                }
            }

            return result.ToString();
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
