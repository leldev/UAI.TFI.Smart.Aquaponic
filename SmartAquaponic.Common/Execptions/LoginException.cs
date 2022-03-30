using System;
using System.Collections.Generic;
using System.Text;

namespace SmartAquaponic.Common.Execptions
{
    public class LoginException : SmartAquaponicException
    {
        public LoginException(string message, string errorCode) : base(message, errorCode)
        {
        }
    }
}
