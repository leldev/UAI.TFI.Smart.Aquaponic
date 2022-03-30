// --------------------------------------------------------------------
// <copyright file="WaterPump.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Domain
{
    using System;
    using SmartAquaponic.Common.Interfaces;

    /// <summary>
    /// WaterPump.
    /// </summary>
    public class WaterPump : IEntity
    {
        /// <inheritdoc/>
        public int Id { get; set; }

        /// <inheritdoc/>
        public DateTime CreatedDate { get; set; }

        /// <inheritdoc/>
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Gets or sets FlowRate.
        /// </summary>
        public int FlowRate { get; set; }

        /// <summary>
        /// Gets or sets Power.
        /// </summary>
        public int Power { get; set; }

        /// <summary>
        /// Gets or sets Volume.
        /// </summary>
        public decimal Volume { get; set; }

        /// <summary>
        /// Gets or sets Name.
        /// </summary>
        public string Name { get; set; }
    }
}