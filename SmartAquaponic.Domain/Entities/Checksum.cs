// --------------------------------------------------------------------
// <copyright file="Checksum.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Domain
{
    using System;
    using SmartAquaponic.Common.Interfaces;

    /// <summary>
    /// Checksum.
    /// </summary>
    public class Checksum : IEntity
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
        /// Gets or sets Table.
        /// </summary>
        public string Table { get; set; }
    }
}
