// --------------------------------------------------------------------
// <copyright file="Lamp.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Domain
{
    using System;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.Domain.Enum;

    /// <summary>
    /// Lamp.
    /// </summary>
    public class Lamp : IEntity
    {
        /// <inheritdoc/>
        public int Id { get; set; }

        /// <inheritdoc/>
        public DateTime CreatedDate { get; set; }

        /// <inheritdoc/>
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Gets or sets Lumen.
        /// </summary>
        public int Lumen { get; set; }

        /// <summary>
        /// Gets or sets Power.
        /// </summary>
        public int Power { get; set; }

        /// <summary>
        /// Gets or sets Socket.
        /// </summary>
        public SocketType Socket { get; set; }

        /// <summary>
        /// Name.
        /// </summary>
        public string Name { get; set; }
    }
}
