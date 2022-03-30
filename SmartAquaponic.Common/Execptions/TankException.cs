using System;
using System.Collections.Generic;
using System.Text;

namespace SmartAquaponic.Common.Execptions
{
    public class TankException : SmartAquaponicException
    {
        public TankException(string message, string errorCode) : base(message, errorCode)
        {
        }
    }
}
