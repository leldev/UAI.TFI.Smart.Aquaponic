// --------------------------------------------------------------------
// <copyright file="AccessSql.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.DataAccess
{
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;

    /// <summary>
    /// AccessSql.
    /// </summary>
    public class AccessSql : IDisposable
    {
        private readonly string connectionString;
        private readonly string masterConnectionString;
        private string message;
        private SqlConnection connection;

        /// <summary>
        /// Initializes a new instance of the <see cref="AccessSql"/> class.
        /// </summary>
        public AccessSql()
        {
            this.connectionString = ConfigurationManager.ConnectionStrings["databaseLocator"].ConnectionString;
            this.masterConnectionString = ConfigurationManager.ConnectionStrings["masterLocator"].ConnectionString;
        }

        /// <summary>
        /// Gets or sets a value indicating whether use master connection string.
        /// </summary>
        public bool UseMaster { get; set; }

        /// <summary>
        /// Read.
        /// </summary>
        /// <param name="name">Name.</param>
        /// <param name="parameters">List of SqlParameter.</param>
        /// <returns>DataSet.</returns>
        public DataSet Read(string name, List<SqlParameter> parameters = null)
        {
            this.Open();

            var dataSet = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter
            {
                SelectCommand = this.CreateCommand(name, parameters),
            };

            try
            {
                adapter.Fill(dataSet);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                this.Close();
            }

            return dataSet;
        }

        /// <summary>
        /// Write.
        /// </summary>
        /// <param name="name">Name.</param>
        /// <param name="parameters">List of SqlParameter.</param>
        /// <returns>Result as int.</returns>
        public int Write(string name, List<SqlParameter> parameters)
        {
            this.Open();

            int result;
            SqlCommand command = this.CreateCommand(name, parameters);
            this.connection.InfoMessage += this.Connection_InfoMessage;

            try
            {
                result = Convert.ToInt32(command.ExecuteScalar());

                // TODO: for dev
                var aux = this.message;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                this.Close();
            }

            return result;
        }

        /// <inheritdoc/>
        public void Dispose()
        {
            this.Close();
        }

        private void Connection_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            this.message += e.Message;
        }

        private void Open()
        {
            this.connection = new SqlConnection(this.UseMaster ? this.masterConnectionString : this.connectionString);
            this.connection.Open();
        }

        private void Close()
        {
            if (this.connection != null)
            {
                this.connection.Close();
                this.connection = null;
            }

            GC.Collect();
        }

        private SqlCommand CreateCommand(string name, List<SqlParameter> parameters = null)
        {
            SqlCommand command = new SqlCommand
            {
                Connection = this.connection,
                CommandText = name,
                CommandType = CommandType.StoredProcedure,
            };

            if (parameters != null && parameters.Count > 0)
            {
                command.Parameters.AddRange(parameters.ToArray());
            }

            return command;
        }
    }
}
