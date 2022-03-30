// --------------------------------------------------------------------
// <copyright file="Plant.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Domain
{
    using System;
    using SmartAquaponic.Common.Interfaces;

    /// <summary>
    /// Plant.
    /// </summary>
    public class Plant : IEntity
    {
        /// <inheritdoc/>
        public int Id { get; set; }

        /// <inheritdoc/>
        public DateTime CreatedDate { get; set; }

        /// <inheritdoc/>
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether IsHydroponic.
        /// </summary>
        public bool IsHydroponic { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether IsLowLight.
        /// </summary>
        public bool IsLowLight { get; set; }

        /// <summary>
        /// Gets or sets Name.
        /// </summary>
        public string Name { get; set; }
    }
}
