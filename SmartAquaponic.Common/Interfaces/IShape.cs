// --------------------------------------------------------------------
// <copyright file="IShape.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Common.Interfaces
{
    /// <summary>
    /// IShape.
    /// </summary>
    public interface IShape
    {
        /// <summary>
        /// Gets or sets Heigth.
        /// </summary>
        decimal Heigth { get; set; }

        /// <summary>
        /// Gets or sets Length.
        /// </summary>
        decimal Length { get; set; }

        /// <summary>
        /// Gets or sets Width.
        /// </summary>
        decimal Width { get; set; }

        /// <summary>
        /// GetArea.
        /// </summary>
        /// <returns>Result as double.</returns>
        //double GetArea();

        ///// <summary>
        ///// GetVolumne.
        ///// </summary>
        ///// <returns>Result as double.</returns>
        //double GetVolumne();
    }
}
