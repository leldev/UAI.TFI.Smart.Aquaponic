// --------------------------------------------------------------------
// <copyright file="CommunicationDal.cs" company="Smart Aquaponic">
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
    using Constants = SmartAquaponic.Common.Constants.DataAccessConstant;

    /// <summary>
    /// CommunicationDal.
    /// </summary>
    public class CommunicationDal : ICrud<Communication>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="CommunicationDal"/> class.
        /// </summary>
        public CommunicationDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(Communication entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.Email, entity.Email),
                SqlHelper.GetParameter(Constants.Parameters.Message, entity.Message),
            };

            return this.context.Write(Constants.StoredProcedures.CreateCommunication, parameters);
        }

        /// <inheritdoc/>
        public int Delete(Communication entity)
        {
            throw new NotImplementedException();
        }

        /// <inheritdoc/>
        public Communication Read(int id)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.CommunicationId, id),
            };

            var ds = this.context.Read(Constants.StoredProcedures.GetCommunication, parameters);

            Communication result = null;

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result = this.GetCommunication(row);
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public IList<Communication> Read()
        {
            List<Communication> result = new List<Communication>();

            var ds = this.context.Read(Constants.StoredProcedures.GetCommunications);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result.Add(this.GetCommunication(row));
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(Communication entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Response, entity.Response),
                SqlHelper.GetParameter(Constants.Parameters.CommunicationId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.ModifiedDate, entity.ModifiedDate),
            };

            return this.context.Write(Constants.StoredProcedures.UpdateCommunication, parameters);
        }

        private Communication GetCommunication(DataRow row)
        {
            return new Communication()
            {
                CreatedDate = Convert.ToDateTime(row[nameof(Communication.CreatedDate)]),
                Id = Convert.ToInt32(row[Constants.Columns.CommunicationId]),
                ModifiedDate = Convert.ToDateTime(row[nameof(Communication.ModifiedDate)]),
                Name = row[nameof(Communication.Name)].ToString(),
                Email = row[nameof(Communication.Email)].ToString(),
                IsAnswered = Convert.ToBoolean(row[nameof(Communication.IsAnswered)]),
                Message = row[nameof(Communication.Message)]?.ToString(),
                Response = row[nameof(Communication.Response)]?.ToString(),
            };
        }
    }
}
