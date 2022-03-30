using System;
using System.Collections.Generic;
using System.Text;

namespace SmartAquaponic.Common.Execptions
{
    public class IntegrityException : SmartAquaponicException
    {
        public IntegrityException(string message, string errorCode) : base(message, errorCode)
        {
        }
    }
}
