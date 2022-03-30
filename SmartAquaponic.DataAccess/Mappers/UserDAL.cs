// --------------------------------------------------------------------
// <copyright file="UserDal.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.DataAccess.Mappers
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Linq;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.Domain;
    using Constants = SmartAquaponic.Common.Constants.DataAccessConstant;

    /// <summary>
    /// UserDal.
    /// </summary>
    public class UserDal : ICrud<User>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserDal"/> class.
        /// </summary>
        public UserDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(User entity)
        {
            var table = new DataTable();
            table.Columns.Add(Constants.Columns.CommonValue, typeof(int));

            foreach (var item in entity.Roles)
            {
                var row = table.NewRow();
                row[Constants.Columns.CommonValue] = item.Id;
                table.Rows.Add(row);
            }

            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.LastName, entity.LastName),
                SqlHelper.GetParameter(Constants.Parameters.Username, entity.Username),
                SqlHelper.GetParameter(Constants.Parameters.Email, entity.Email),
                SqlHelper.GetParameter(Constants.Parameters.Password, entity.Password),
                SqlHelper.GetParameter(Constants.Parameters.UserPreferenceId, entity.Preference.Id),
                SqlHelper.GetParameter(Constants.Parameters.Roles, SqlHelper.GetDataTableFromList(entity.Roles)),
            };

            return this.context.Write(Constants.StoredProcedures.CreateUser, parameters);
        }

        /// <inheritdoc/>
        public int Delete(User entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.UserId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.DeleteUser, parameters);
        }

        /// <inheritdoc/>
        public User Read(int id)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.UserId, id),
            };

            var ds = this.context.Read(Constants.StoredProcedures.GetUser, parameters);

            // TODO: update CU (EA)
            User user = null;

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    user = this.GetUser(row);
                }
            }

            return user;
        }

        /// <inheritdoc/>
        public IList<User> Read()
        {
            // TODO: update CU (EA)
            List<User> result = new List<User>();

            var ds = this.context.Read(Constants.StoredProcedures.GetUsers);

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result.Add(this.GetUser(row));
                }
            }

            return result;
        }

        /// <inheritdoc/>
        public int Update(User entity)
        {
            var table = new DataTable();
            table.Columns.Add(Constants.Columns.CommonValue, typeof(int));

            foreach (var item in entity.Roles)
            {
                var row = table.NewRow();
                row[Constants.Columns.CommonValue] = item.Id;
                table.Rows.Add(row);
            }

            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.UserId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.ModifiedDate, entity.ModifiedDate),
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.LastName, entity.LastName),
                SqlHelper.GetParameter(Constants.Parameters.UserPreferenceId, entity.Preference.Id),
                SqlHelper.GetParameter(Constants.Parameters.Roles, SqlHelper.GetDataTableFromList(entity.Roles)),
            };

            return this.context.Write(Constants.StoredProcedures.UpdateUser, parameters);
        }

        /// <summary>
        /// UpdateLoginAttempts.
        /// </summary>
        /// <param name="entity">Entity.</param>
        /// <returns>Result as int.</returns>
        public int UpdateLoginAttempts(User entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.UserId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.LoginAttempts, entity.LoginAttempts),
                SqlHelper.GetParameter(Constants.Parameters.IsLocked, entity.IsLocked),
            };

            return this.context.Write(Constants.StoredProcedures.UpdateLoginAttempts, parameters);
        }

        /// <summary>
        /// Recovery.
        /// </summary>
        /// <param name="entity">Entity.</param>
        /// <returns>Result as int.</returns>
        public int Recovery(User entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.UserId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.RecoveryUser, parameters);
        }

        /// <summary>
        /// RecoveryPassword.
        /// </summary>
        /// <param name="entity">Entity.</param>
        /// <returns>Result as int.</returns>
        public int RecoveryPassword(User entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.UserId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.Email, entity.Email),
                SqlHelper.GetParameter(Constants.Parameters.TempPassword, entity.TempPassword),
            };

            return this.context.Write(Constants.StoredProcedures.RecoveryPassword, parameters);
        }

        /// <summary>
        /// ResetPassword.
        /// </summary>
        /// <param name="entity">Entity.</param>
        /// <returns>Result as int.</returns>
        public int ResetPassword(User entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.UserId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.Password, entity.Password),
            };

            return this.context.Write(Constants.StoredProcedures.ResetPassword, parameters);
        }

        /// <summary>
        /// Unlock.
        /// </summary>
        /// <param name="entity">Entity.</param>
        /// <returns>Result as int.</returns>
        public int Unlock(User entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.UserId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.UnlockUser, parameters);
        }

        /// <summary>
        /// Login.
        /// </summary>
        /// <param name="username">Username.</param>
        /// <returns>User logged.</returns>
        public User Login(string username)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Username, username),
            };

            var ds = this.context.Read(Constants.StoredProcedures.Login, parameters);

            // TODO: update CU (EA)
            User user = null;

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    user = this.GetUser(row);
                }
            }

            return user;
        }

        private User GetUser(DataRow row)
        {
            return new User()
            {
                CreatedDate = Convert.ToDateTime(row[nameof(User.CreatedDate)]),
                Id = Convert.ToInt32(row[Constants.Columns.UserId]),
                ModifiedDate = Convert.ToDateTime(row[nameof(User.ModifiedDate)]),
                Name = row[nameof(User.Name)].ToString(),
                Email = row[nameof(User.Email)].ToString(),
                Hash = Convert.ToInt32(row[nameof(User.Hash)]),
                IsLocked = Convert.ToBoolean(row[nameof(User.IsLocked)]),
                IsDeleted = Convert.ToBoolean(row[nameof(User.IsDeleted)]),
                Password = row[nameof(User.Password)].ToString(),
                LastName = row[nameof(User.LastName)].ToString(),
                LoginAttempts = Convert.ToInt32(row[nameof(User.LoginAttempts)]),
                Preference = new UserPreference()
                {
                    Id = Convert.ToInt32(row[Constants.Columns.UserPreferenceId]),
                },
                TempPassword = row[nameof(User.TempPassword)].ToString(),
                Username = row[nameof(User.Username)].ToString(),
                Roles = new List<Role>(),
            };
        }
    }
}
