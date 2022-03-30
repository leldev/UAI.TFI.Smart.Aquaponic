// --------------------------------------------------------------------
// <copyright file="Role.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Domain
{
    using System;
    using SmartAquaponic.Common.Interfaces;

    /// <summary>
    /// Role.
    /// </summary>
    public class Role : IEntity
    {
        /// <inheritdoc/>
        public int Id { get; set; }

        /// <inheritdoc/>
        public DateTime CreatedDate { get; set; }

        /// <inheritdoc/>
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Gets or sets name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// IsValid.
        /// </summary>
        /// <param name="role">Role.</param>
        /// <returns>bool.</returns>
        public virtual bool IsValid(string role)
        {
            return role.Equals(this.Name);
        }
    }
}
