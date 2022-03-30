// --------------------------------------------------------------------
// <copyright file="Fish.cs" company="Smart Aquaponic">
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
    /// Fish.
    /// </summary>
    public class Fish : IEntity
    {
        /// <inheritdoc/>
        public int Id { get; set; }

        /// <inheritdoc/>
        public DateTime CreatedDate { get; set; }

        /// <inheritdoc/>
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether IsLonely.
        /// </summary>
        public bool IsLonely { get; set; }

        /// <summary>
        /// Gets or sets WaterRequired.
        /// </summary>
        public decimal WaterRequired { get; set; }

        /// <summary>
        /// Gets or sets Name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets Ph.
        /// </summary>
        public PhType Ph { get; set; }

        /// <summary>
        /// Gets or sets Predators.
        /// </summary>
        public IList<Fish> Predators { get; set; }

        /// <summary>
        /// Gets or sets Size.
        /// </summary>
        public decimal Size { get; set; }

        /// <summary>
        /// Gets or sets Temp.
        /// </summary>
        public decimal Temp { get; set; }
    }
}