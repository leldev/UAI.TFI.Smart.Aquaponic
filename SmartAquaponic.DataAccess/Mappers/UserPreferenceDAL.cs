// --------------------------------------------------------------------
// <copyright file="UserPreferenceDal.cs" company="Smart Aquaponic">
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
    /// UserPreferenceDal.
    /// </summary>
    public class UserPreferenceDal : ICrud<UserPreference>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserPreferenceDal"/> class.
        /// </summary>
        public UserPreferenceDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(UserPreference entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.DateFormat, entity.DateFormat),
                SqlHelper.GetParameter(Constants.Parameters.TimeZone, entity.TimeZone),
            };

            return this.context.Write(Constants.StoredProcedures.CreateUserPreference, parameters);
        }

        /// <inheritdoc/>
        public int Delete(UserPreference entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.UserPreferenceId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.DeleteUserPreference, parameters);
        }

        /// <inheritdoc/>
        public UserPreference Read(int id)
        {
            var parameters = new List<SqlParameter>()
            {
                SqlHelper.GetParameter(Constants.Parameters.UserPreferenceId, id),
            };

            var ds = this.context.Read(Constants.StoredProcedures.GetUserPreference, parameters);

            UserPreference result = null;

            for (int i = 0; i < ds.Tables.Count; i++)
            {
                if (i == 0)
                {
                    foreach (DataRow row in ds.Tables[i].Rows)
                    {
                        result = this.GetUserPreference(row);
                    }
                }

                if (i == 1)
                {
                    foreach (DataRow row in ds.Tables[i].Rows)
                    {
                        result.Resources.Add(this.GetResource(row));
                    }
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public IList<UserPreference> Read()
        {
            List<UserPreference> result = new List<UserPreference>();
            var ds = this.context.Read(Constants.StoredProcedures.GetUserPreferences);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result.Add(this.GetUserPreference(row));
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(UserPreference entity)
        {
            var table = new DataTable();
            table.Columns.Add(Constants.Columns.Key, typeof(int));
            table.Columns.Add(Constants.Columns.Value, typeof(string));

            foreach (var item in entity.Resources)
            {
                var row = table.NewRow();
                row[Constants.Columns.Key] = item.Id;
                row[Constants.Columns.Value] = item.Value;
                table.Rows.Add(row);
            }

            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.UserPreferenceId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.DateFormat, entity.DateFormat),
                SqlHelper.GetParameter(Constants.Parameters.TimeZone, entity.TimeZone),
                SqlHelper.GetParameter(Constants.Parameters.ModifiedDate, entity.ModifiedDate),
                SqlHelper.GetParameter(Constants.Parameters.Resources, table, "TTDictionary"),
            };

            return this.context.Write(Constants.StoredProcedures.UpdateUserPreference, parameters);
        }

        private UserPreference GetUserPreference(DataRow row)
        {
            return new UserPreference()
            {
                CreatedDate = Convert.ToDateTime(row[nameof(UserPreference.CreatedDate)]),
                Id = Convert.ToInt32(row[Constants.Columns.UserPreferenceId]),
                ModifiedDate = Convert.ToDateTime(row[nameof(UserPreference.ModifiedDate)]),
                Name = row[nameof(UserPreference.Name)].ToString(),
                DateFormat = row[nameof(UserPreference.DateFormat)].ToString(),
                IsDefault = Convert.ToBoolean(row[nameof(UserPreference.IsDefault)]),
                Resources = new List<Resource>(),
                TimeZone = row[nameof(UserPreference.TimeZone)].ToString(),
            };
        }

        private Resource GetResource(DataRow row)
        {
            return new Resource()
            {
                CreatedDate = Convert.ToDateTime(row[nameof(Resource.CreatedDate)]),
                Id = Convert.ToInt32(row[Constants.Columns.ResourceId]),
                ModifiedDate = Convert.ToDateTime(row[nameof(Resource.ModifiedDate)]),
                Key = row[Constants.Columns.Key].ToString(),
                Value = row[Constants.Columns.Value].ToString(),
            };
        }
    }
}
