// --------------------------------------------------------------------
// <copyright file="IShapeStrategy.cs" company="Smart Aquaponic">
// Copyright (c) Smart Aquaponic. All rights reserved.
// </copyright>
// --------------------------------------------------------------------

namespace SmartAquaponic.Common.Interfaces
{
    /// <summary>
    /// IShape.
    /// </summary>
    public interface IShapeStrategy
    {
        /// <summary>
        /// GetArea.
        /// </summary>
        /// <returns>Result as double.</returns>
        //double GetArea();

        ///// <summary>
        ///// GetVolumne.
        ///// </summary>
        ///// <returns>Result as double.</returns>
        decimal GetVolume(decimal heigth, decimal length, decimal width);
    }
}
