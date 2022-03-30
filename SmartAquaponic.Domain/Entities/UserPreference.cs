// --------------------------------------------------------------------
// <copyright file="UserPreference.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Domain
{
    using System;
    using System.Collections.Generic;
    using SmartAquaponic.Common.Interfaces;

    /// <summary>
    /// UserPreference.
    /// </summary>
    public class UserPreference : IEntity
    {
        /// <inheritdoc/>
        public int Id { get; set; }

        /// <inheritdoc/>
        public DateTime CreatedDate { get; set; }

        /// <inheritdoc/>
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Gets or sets DateFormat.
        /// </summary>
        public string DateFormat { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether IsDefault.
        /// </summary>
        public bool IsDefault { get; set; }

        /// <summary>
        /// Gets or sets Name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets Resources.
        /// </summary>
        public IList<Resource> Resources { get; set; }

        /// <summary>
        /// Gets or sets TimeZone.
        /// </summary>
        public string TimeZone { get; set; }
    }
}
