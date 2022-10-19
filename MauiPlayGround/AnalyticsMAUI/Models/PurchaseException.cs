using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AnalyticsMAUI.Models
{
    public class PurchaseException : Exception
    {
        public PurchaseExceptionType ExceptionType { get; }
        public bool RetrySuggested { get; }

        public PurchaseException(PurchaseExceptionType exceptionType, bool retrySuggested,
            Exception baseException = null, string errorMessage = null)
            : base(
                $"failed to execute purchase: {exceptionType}{(errorMessage != null ? $" ({errorMessage})" : "")} retry{(retrySuggested ? "" : " not")} suggested",
                baseException)
        {
            ExceptionType = exceptionType;
            RetrySuggested = retrySuggested;
        }
    }
}
