using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Text;

namespace SmartAquaponic.Common.Execptions
{
    public class UnauthorizedException : SmartAquaponicException
    {
        public UnauthorizedException(string message, string errorCode) 
            : base(message, errorCode)
        {
        }
    }
}
