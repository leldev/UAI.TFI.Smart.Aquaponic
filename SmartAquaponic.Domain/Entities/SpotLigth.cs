﻿// --------------------------------------------------------------------
// <copyright file="SpotLight.cs" company="Smart Aquaponic">
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
    /// SpotLight.
    /// </summary>
    public class SpotLight : IEntity, IShape
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
        /// Gets or sets Lamps.
        /// </summary>
        public IList<Lamp> Lamps { get; set; }

        /// <summary>
        /// Gets or sets Name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets Slots.
        /// </summary>
        public int Slots { get; set; }

        /// <summary>
        /// Gets or sets Socket.
        /// </summary>
        public SocketType Socket { get; set; }
    }
}
