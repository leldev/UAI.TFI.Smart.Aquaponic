// --------------------------------------------------------------------
// <copyright file="ChecksumDal.cs" company="Smart Aquaponic">
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
    /// ChecksumDal.
    /// </summary>
    public class ChecksumDal : ICrud<Checksum>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="ChecksumDal"/> class.
        /// </summary>
        public ChecksumDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(Checksum entity)
        {
            throw new NotImplementedException();
        }

        /// <inheritdoc/>
        public int Delete(Checksum entity)
        {
            throw new NotImplementedException();
        }

        /// <inheritdoc/>
        public Checksum Read(int id)
        {
            throw new NotImplementedException();
        }

        /// <inheritdoc/>
        public IList<Checksum> Read()
        {
            // TODO: update CU (EA)
            List<Checksum> result = new List<Checksum>();

            var ds = this.context.Read(Constants.StoredProcedures.GetChecksum);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result.Add(this.GetChecksum(row));
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(Checksum entity)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Update.
        /// </summary>
        /// <param name="entity">Log.</param>
        /// <param name="checksum">Checksum.</param>
        /// <returns>Result.</returns>
        public int Update(Log entity, int checksum)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.LogId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.Hash, checksum),
                SqlHelper.GetParameter(Constants.Parameters.Table, nameof(Log)),
            };

            return this.context.Write(Constants.StoredProcedures.ChecksumLog, parameters);
        }

        /// <summary>
        /// Update.
        /// </summary>
        /// <param name="entity">User.</param>
        /// <param name="checksum">Checksum.</param>
        /// <returns>Result.</returns>
        public int Update(User entity, int checksum)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.UserId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.Hash, checksum),
                SqlHelper.GetParameter(Constants.Parameters.Table, nameof(User)),
            };

            return this.context.Write(Constants.StoredProcedures.ChecksumUser, parameters);
        }

        private Checksum GetChecksum(DataRow row)
        {
            return new Checksum()
            {
                CreatedDate = Convert.ToDateTime(row[nameof(Checksum.CreatedDate)]),
                Id = Convert.ToInt32(row[Constants.Columns.ChecksumId]),
                ModifiedDate = Convert.ToDateTime(row[nameof(Checksum.ModifiedDate)]),
                Hash = Convert.ToInt32(row[nameof(Checksum.Hash)]),
                Table = row[nameof(Checksum.Table)].ToString(),
            };
        }
    }
}
