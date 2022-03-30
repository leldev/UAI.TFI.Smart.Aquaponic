// --------------------------------------------------------------------
// <copyright file="IEntity.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Common.Interfaces
{
    using System;

    /// <summary>
    /// IEntity.
    /// </summary>
    public interface IEntity
    {
        /// <summary>
        /// Gets or sets id.
        /// </summary>
        int Id { get; set; }

        /// <summary>
        /// Gets or sets created date.
        /// </summary>
        DateTime CreatedDate { get; set; }

        /// <summary>
        /// Gets or sets modified date.
        /// </summary>
        DateTime ModifiedDate { get; set; }
    }
}
