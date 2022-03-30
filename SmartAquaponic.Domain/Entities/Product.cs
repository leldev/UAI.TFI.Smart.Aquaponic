// --------------------------------------------------------------------
// <copyright file="Product.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Domain
{
    using System;
    using SmartAquaponic.Common.Interfaces;

    /// <summary>
    /// Product.
    /// </summary>
    public class Product : IEntity
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
        /// Gets or sets Pot.
        /// </summary>
        public Pot Pot { get; set; }

        /// <summary>
        /// Gets or sets SpotLight.
        /// </summary>
        public SpotLight SpotLight { get; set; }

        /// <summary>
        /// Gets or sets Tank.
        /// </summary>
        public Tank Tank { get; set; }
    }
}
