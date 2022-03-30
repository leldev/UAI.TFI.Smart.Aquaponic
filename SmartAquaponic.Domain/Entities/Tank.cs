// --------------------------------------------------------------------
// <copyright file="Tank.cs" company="Smart Aquaponic">
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
    /// Tank.
    /// </summary>
    public class Tank : IEntity, IShape
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
        /// Name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets Decors.
        /// </summary>
        public IList<Decor> Decors { get; set; }

        /// <summary>
        /// Gets or sets Fishes.
        /// </summary>
        public IList<Fish> Fishes { get; set; }

        /// <summary>
        /// Gets or sets Ph.
        /// </summary>
        public PhType Ph { get; set; }

        /// <summary>
        /// Gets or sets WaterPump.
        /// </summary>
        public WaterPump WaterPump { get; set; }

        /// <summary>
        /// Gets or sets WaterTemp.
        /// </summary>
        public decimal WaterTemp { get; set; }
    }
}
