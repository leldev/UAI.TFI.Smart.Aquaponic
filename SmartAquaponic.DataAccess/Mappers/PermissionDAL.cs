// --------------------------------------------------------------------
// <copyright file="PermissionDal.cs" company="Smart Aquaponic">
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
    /// PermissionDal.
    /// </summary>
    public class PermissionDal : ICrud<Group>
    {
        private readonly AccessSql context;

        /// <summary>
        /// Initializes a new instance of the <see cref="PermissionDal"/> class.
        /// </summary>
        public PermissionDal()
        {
            this.context = new AccessSql();
        }

        /// <inheritdoc/>
        public int Create(Group entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.Roles, SqlHelper.GetDataTableFromList(entity.Roles)),
            };

            return this.context.Write(Constants.StoredProcedures.CreateGroup, parameters);
        }

        /// <inheritdoc/>
        public int Delete(Group entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.GroupId, entity.Id),
            };

            return this.context.Write(Constants.StoredProcedures.DeleteGroup, parameters);
        }

        /// <inheritdoc/>
        public Group Read(int id)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.GroupId, id),
            };

            var ds = this.context.Read(Constants.StoredProcedures.GetGroup, parameters);

            Group group = null;

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    if (group == null)
                    {
                        group = new Group()
                        {
                            CreatedDate = Convert.ToDateTime(row[nameof(Group.CreatedDate)]),
                            Id = Convert.ToInt32(row[Constants.Columns.GroupId]),
                            ModifiedDate = Convert.ToDateTime(row[nameof(Group.ModifiedDate)]),
                            Name = row[Constants.Columns.GroupName].ToString(),
                            Roles = new List<Role>(),
                        };
                    }

                    if (!row.IsNull(Constants.Columns.RoleId))
                    {
                        group.Roles.Add(new Role()
                        {
                            Id = Convert.ToInt32(row[Constants.Columns.RoleId]),
                            Name = row[Constants.Columns.RoleName].ToString(),
                        });
                    }
                }
            }

            return group;
        }

        /// <summary>
        /// GetUserRoles.
        /// </summary>
        /// <param name="userId">User id.</param>
        /// <returns>List of roles.</returns>
        public IList<Role> GetUserRoles(int userId)
        {
            List<Role> result = new List<Role>();

            // Data
            var allRoles = this.GetRoles().ToList();
            var allGroups = this.Read();
            var groups = new List<Group>();

            foreach (var group in allGroups)
            {
                var newGroup = new Group()
                {
                    Id = group.Id,
                    Name = group.Name,
                    Roles = new List<Role>(),
                };

                foreach (var role in group.Roles)
                {
                    if (role.Id < 100)
                    {
                        var roleIndex = allRoles.FindIndex(x => x.Id == role.Id);
                        newGroup.Roles.Add(allRoles[roleIndex]);
                    }
                }

                groups.Add(newGroup);
            }

            foreach (var group in allGroups)
            {
                var groupIndex = groups.FindIndex(x => x.Id == group.Id);

                foreach (var role in group.Roles)
                {
                    if (role.Id > 100)
                    {
                        var relateGroupIndex = groups.FindIndex(x => x.Id == role.Id);
                        groups[groupIndex].Roles.Add(groups[relateGroupIndex]);
                    }
                }
            }


            // User roles.
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.UserId, userId),
            };

            result.AddRange(this.GetRoles(this.context.Read(Constants.StoredProcedures.GetRoles, parameters)));


            // User groups.
            parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.UserId, userId),
            };

            var userGroups = this.GetGroups(this.context.Read(Constants.StoredProcedures.GetGroups, parameters));

            foreach (var group in userGroups)
            {
                var groupIndex = groups.FindIndex(x => x.Id == group.Id);
                result.Add(groups[groupIndex]);
            }

            return result;
        }

        /// <inheritdoc/>
        public IList<Group> Read()
        {
            // TODO: remove GetGroups (EA)
            return this.GetGroups(this.context.Read(Constants.StoredProcedures.GetGroups));
        }

        /// <summary>
        /// GetRoles.
        /// </summary>
        /// <returns>Return a list of Role.</returns>
        public IList<Role> GetRoles()
        {
            return this.GetRoles(this.context.Read(Constants.StoredProcedures.GetRoles));
        }

        /// <inheritdoc/>
        public int Update(Group entity)
        {
            var parameters = new List<SqlParameter>
            {
                SqlHelper.GetParameter(Constants.Parameters.Name, entity.Name),
                SqlHelper.GetParameter(Constants.Parameters.GroupId, entity.Id),
                SqlHelper.GetParameter(Constants.Parameters.ModifiedDate, entity.ModifiedDate),
                SqlHelper.GetParameter(Constants.Parameters.Roles, SqlHelper.GetDataTableFromList(entity.Roles)),
            };

            return this.context.Write(Constants.StoredProcedures.UpdateGroup, parameters);
        }

        private List<Role> GetRoles(DataSet dataSet)
        {
            List<Role> result = new List<Role>();

            foreach (DataTable table in dataSet.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    result.Add(new Role()
                    {
                        CreatedDate = Convert.ToDateTime(row[nameof(Role.CreatedDate)]),
                        Id = Convert.ToInt32(row[Constants.Columns.RoleId]),
                        ModifiedDate = Convert.ToDateTime(row[nameof(Role.ModifiedDate)]),
                        Name = row[nameof(Role.Name)].ToString(),
                    });
                }
            }

            return result;
        }

        private List<Group> GetGroups(DataSet dataSet)
        {
            List<Group> result = new List<Group>();

            foreach (DataTable table in dataSet.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    var groupId = Convert.ToInt32(row[Constants.Columns.GroupId]);
                    var group = result.FirstOrDefault(x => x.Id.Equals(groupId));
                    if (group == null)
                    {
                        result.Add(new Group()
                        {
                            CreatedDate = Convert.ToDateTime(row[nameof(Group.CreatedDate)]),
                            Id = groupId,
                            ModifiedDate = Convert.ToDateTime(row[nameof(Group.ModifiedDate)]),
                            Name = row[Constants.Columns.GroupName].ToString(),
                            Roles = row.IsNull(Constants.Columns.RoleId) ? new List<Role>() : new List<Role>()
                    {
                        new Role()
                        {
                            Id = Convert.ToInt32(row[Constants.Columns.RoleId].ToString()),
                            Name = row[Constants.Columns.RoleName].ToString(),
                        },
                    },
                        });
                    }
                    else
                    {
                        group.Roles.Add(new Role()
                        {
                            Id = Convert.ToInt32(row[Constants.Columns.RoleId].ToString()),
                            Name = row[Constants.Columns.RoleName].ToString(),
                        });
                    }
                }
            }

            return result;
        }
    }
}
