// --------------------------------------------------------------------
// <copyright file="LogDal.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.DataAccess.Mappers
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Domain.Enum;
    using Constants = SmartAquaponic.Common.Constants.DataAccessConstant;

    /// <summary>
    /// LogDal.
    /// </summary>
    public class LogDal : ICrud<Log>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="LogDal"/> class.
        /// </summary>
        public LogDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(Log entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.EventId, (int)entity.Event),
                SqlHelper.GetParameter(Constants.Parameters.Ip, entity.Ip),
                SqlHelper.GetParameter(Constants.Parameters.Message, entity.Message),
            };

            if (entity.User != null)
            {
                parameters.Add(SqlHelper.GetParameter(Constants.Parameters.UserId, entity.User.Id));
            }

            return this.context.Write(Constants.StoredProcedures.CreateLog, parameters);
        }

        /// <inheritdoc/>
        public IList<Log> Read()
        {
            List<Log> result = new List<Log>();

            var ds = this.context.Read(Constants.StoredProcedures.GetLogs);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result.Add(new Log()
                    {
                        CreatedDate = Convert.ToDateTime(row[nameof(Log.CreatedDate)]),
                        Id = Convert.ToInt32(row[Constants.Columns.LogId]),
                        ModifiedDate = Convert.ToDateTime(row[nameof(Log.ModifiedDate)]),
                        Message = row[nameof(Log.Message)].ToString(),
                        Hash = Convert.ToInt32(row[nameof(Log.Hash)]),
                        Ip = row[nameof(Log.Ip)].ToString(),
                        User = row.IsNull(Constants.Columns.UserId) ? null : new User()
                        {
                            Id = Convert.ToInt32(row[Constants.Columns.UserId]),
                            Name = row[nameof(User.Name)].ToString(),
                            LastName = row[nameof(User.LastName)].ToString(),
                        },
                        Event = (EventType)Convert.ToInt32(row[Constants.Columns.EventId]),
                    });
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(Log entity)
        {
            throw new NotImplementedException();
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
    }
}
