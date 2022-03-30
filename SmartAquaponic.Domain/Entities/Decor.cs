// --------------------------------------------------------------------
// <copyright file="Decor.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Domain
{
    using System;
    using SmartAquaponic.Common.Interfaces;

    /// <summary>
    /// Decor.
    /// </summary>
    public class Decor : IEntity
    {
        /// <inheritdoc/>
        public int Id { get; set; }

        /// <inheritdoc/>
        public DateTime CreatedDate { get; set; }

        /// <inheritdoc/>
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Type.
        /// </summary>
        public string Type { get; set; }

        /// <summary>
        /// Volume.
        /// </summary>
        public decimal Volume { get; set; }
    }
}