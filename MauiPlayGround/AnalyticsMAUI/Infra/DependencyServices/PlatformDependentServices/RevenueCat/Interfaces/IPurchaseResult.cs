using AnalyticsMAUI.Models;

namespace AnalyticsMAUI.Infra
{
    public interface IPurchaseResult
    {
        string PurchaseId { get; }
        IPurchasableProduct Product { get; }
        DateTime TransactionDateUtc { get; }
        string PurchaseToken { get; }
        DateTime? ExpirationAt { get; }
    }
}
