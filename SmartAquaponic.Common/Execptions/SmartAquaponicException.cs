using System;
using System.Collections.Generic;
using System.Text;

namespace SmartAquaponic.Common.Execptions
{
    public class SmartAquaponicException : Exception
    {
        public string ErrorCode { get; set; }

        public SmartAquaponicException(string message, string errorCode)
            :base(message)
        {
            this.ErrorCode = errorCode;
        }

        public SmartAquaponicException(string message) : base(message)
        {
        }
    }
}
