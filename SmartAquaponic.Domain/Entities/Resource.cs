// --------------------------------------------------------------------
// <copyright file="Resource.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Domain
{
    using System;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.Domain.Enum;

    /// <summary>
    /// Resource.
    /// </summary>
    public class Resource : IEntity
    {
        /// <inheritdoc/>
        public int Id { get; set; }

        /// <inheritdoc/>
        public DateTime CreatedDate { get; set; }

        /// <inheritdoc/>
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Gets or sets Key.
        /// </summary>
        public string Key { get; set; }

        /// <summary>
        /// Gets or sets Value.
        /// </summary>
        public string Value { get; set; }
    }
}
