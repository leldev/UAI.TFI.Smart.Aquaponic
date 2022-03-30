using SmartAquaponic.Common.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace SmartAquaponic.Common.Strategy
{
    public abstract class ShapeStrategy : IShapeStrategy
    {
        public virtual decimal GetVolume(decimal heigth, decimal length, decimal width)
        {
            return heigth * length * width;
        }
    }
}
