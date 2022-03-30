// --------------------------------------------------------------------
// <copyright file="User.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Domain
{
    using System;
    using System.Collections.Generic;
    using SmartAquaponic.Common.Interfaces;

    /// <summary>
    /// User.
    /// </summary>
    public class User : IEntity
    {
        /// <inheritdoc/>
        public int Id { get; set; }

        /// <inheritdoc/>
        public DateTime CreatedDate { get; set; }

        /// <inheritdoc/>
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Gets or sets Hash.
        /// </summary>
        public int Hash { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether IsLocked.
        /// </summary>
        public bool IsLocked { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether IsDeleted.
        /// </summary>
        public bool IsDeleted { get; set; }

        /// <summary>
        /// Gets or sets Name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets LastName.
        /// </summary>
        public string LastName { get; set; }

        /// <summary>
        /// Gets or sets Password.
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// Gets or sets Username.
        /// </summary>
        public string Username { get; set; }

        /// <summary>
        /// Gets or sets Email.
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// Gets or sets LoginAttemts.
        /// </summary>
        public int LoginAttempts { get; set; }

        /// <summary>
        /// Gets or sets Preference.
        /// </summary>
        public UserPreference Preference { get; set; }

        /// <summary>
        /// Gets or sets Roles.
        /// </summary>
        public IList<Role> Roles { get; set; }

        /// <summary>
        /// Gets or sets TempPassword.
        /// </summary>
        public string TempPassword { get; set; }

        public override string ToString()
        {
            return $"{this.Name} {this.LastName}";
        }
    }
}
