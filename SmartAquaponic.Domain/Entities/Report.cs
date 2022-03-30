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
    public class Report : IEntity
    {
        /// <inheritdoc/>
        public int Id { get; set; }

        /// <inheritdoc/>
        public DateTime CreatedDate { get; set; }

        /// <inheritdoc/>
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Gets or sets Name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets Type.
        /// </summary>
        public string Type { get; set; }

        /// <summary>
        /// Gets or sets Cant.
        /// </summary>
        public int Cant { get; set; }
    }
}
