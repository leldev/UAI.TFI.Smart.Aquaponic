// --------------------------------------------------------------------
// <copyright file="Pot.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Domain
{
    using System;
    using System.Collections.Generic;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.Domain.Enum;

    /// <summary>
    /// Pot.
    /// </summary>
    public class Pot : IEntity, IShape
    {
        /// <inheritdoc/>
        public int Id { get; set; }

        /// <inheritdoc/>
        public DateTime CreatedDate { get; set; }

        /// <inheritdoc/>
        public DateTime ModifiedDate { get; set; }

        /// <inheritdoc/>
        public decimal Heigth { get; set; }

        /// <inheritdoc/>
        public decimal Length { get; set; }

        /// <inheritdoc/>
        public decimal Width { get; set; }

        /// <summary>
        /// Gets or sets Name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets Plants.
        /// </summary>
        public IList<Plant> Plants { get; set; }

        /// <summary>
        /// Gets or sets Rgb.
        /// </summary>
        public string Rgb { get; set; }

        /// <summary>
        /// Gets or sets Rock.
        /// </summary>
        public RockType Rock { get; set; }
    }
}
