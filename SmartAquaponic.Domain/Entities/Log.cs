// --------------------------------------------------------------------
// <copyright file="Log.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Domain
{
    using System;
    using SmartAquaponic.Common.Interfaces;
    using SmartAquaponic.Domain.Enum;

    /// <summary>
    /// Log.
    /// </summary>
    public class Log : IEntity
    {
        /// <inheritdoc/>
        public int Id { get; set; }

        /// <inheritdoc/>
        public DateTime CreatedDate { get; set; }

        /// <inheritdoc/>
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Gets or sets Hash.
        /// </summary>
        public int Hash { get; set; }

        /// <summary>
        /// Gets or sets Event.
        /// </summary>
        public EventType Event { get; set; }

        /// <summary>
        /// Gets or sets Ip.
        /// </summary>
        public string Ip { get; set; }

        /// <summary>
        /// Gets or sets Message.
        /// </summary>
        public string Message { get; set; }

        /// <summary>
        /// Gets or sets User.
        /// </summary>
        public User User { get; set; }
    }
}
