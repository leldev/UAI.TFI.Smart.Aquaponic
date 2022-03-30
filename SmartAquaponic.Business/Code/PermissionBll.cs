// --------------------------------------------------------------------
// <copyright file="PermissionBll.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Business
{
    using System;
    using System.Collections.Generic;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.DataAccess.Mappers;
    using SmartAquaponic.Domain;
    using SmartAquaponic.Domain.Enum;

    /// <summary>
    /// PermissionBll.
    /// </summary>
    public class PermissionBll : ICrud<Group>
    {
        private readonly string ip = "127.0 0.1";
        private readonly User currentUser;
        private readonly PermissionDal mapper;

        /// <summary>
        /// Initializes a new instance of the <see cref="PermissionBll"/> class.
        /// </summary>
        public PermissionBll()
        {
            this.mapper = new PermissionDal();
        }

        public PermissionBll(User currentUser, string ip)
        {
            this.currentUser = currentUser;
            this.ip = ip;
            this.mapper = new PermissionDal();
        }

        /// <inheritdoc/>
        public int Create(Group entity)
        {
            var id = this.mapper.Create(entity);

            if (id > 0)
            {
                this.LogMessage($"Group {id} created.");
            }

            return id;
        }

        /// <inheritdoc/>
        public int Delete(Group entity)
        {
            var id = this.mapper.Delete(entity);

            if (id > 0)
            {
                this.LogMessage($"Group {id} deleted.");
            }

            return id;
        }

        /// <inheritdoc/>
        public Group Read(int id)
        {
            return this.mapper.Read(id);
        }

        /// <inheritdoc/>
        public IList<Group> Read()
        {
            return this.mapper.Read();
        }

        /// <inheritdoc/>
        public int Update(Group entity)
        {
            var id = this.mapper.Update(entity);

            if (id > 0)
            {
                this.LogMessage($"Group {id} updated.");
            }

            return id;
        }

        /// <summary>
        /// GetGorups.
        /// </summary>
        /// <returns>Return a list of Group.</returns>
        public IList<Group> GetGorups()
        {
            return this.mapper.Read();
        }

        /// <summary>
        /// GetRoles.
        /// </summary>
        /// <returns>Return a list of Role.</returns>
        public IList<Role> GetRoles()
        {
            return this.mapper.GetRoles();
        }

        /// <summary>
        /// GetRolesAndGroups.
        /// </summary>
        /// <returns>Return a list of Role.</returns>
        public IList<Role> GetRolesAndGroups()
        {
            List<Role> result = new List<Role>();

            result.AddRange(this.GetRoles());
            result.AddRange(this.GetGorups());

            return result;
        }

        /// <summary>
        /// GetUserRoles.
        /// </summary>
        /// <param name="userId">User id.</param>
        /// <returns>Return a list of Role.</returns>
        public IList<Role> GetUserRoles(int userId)
        {
            return this.mapper.GetUserRoles(userId);
        }

        /// <summary>
        /// IsPermissionAsseigned.
        /// </summary>
        /// <param name="userId">User id.</param>
        /// <returns>Result as bool.</returns>
        public bool IsPermissionAsseigned(int userId)
        {
            throw new NotImplementedException();
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
