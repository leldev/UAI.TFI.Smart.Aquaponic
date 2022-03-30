using System;
using System.Collections.Generic;
using System.Text;

namespace SmartAquaponic.Common.Execptions
{
    public class UserMustResetPasswordException : SmartAquaponicException
    {
        public UserMustResetPasswordException(string message) : base(message)
        {
        }

        public UserMustResetPasswordException(string message, string errorCode) : base(message, errorCode)
        {
        }
    }
}
