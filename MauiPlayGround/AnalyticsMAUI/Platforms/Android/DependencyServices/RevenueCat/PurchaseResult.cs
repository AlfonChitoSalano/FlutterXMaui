using AnalyticsMAUI.Models;
using AnalyticsMAUI.Infra;
using Xamarin.RevenueCat.Android.Extensions;

namespace AnalyticsMAUI.Platforms
{
    public class PurchaseResult : IPurchaseResult
    {
        public DateTime? ExpirationAt { get; }
        public PurchaseSuccessInfo RevenueCatResult { get; }
        public PurchasableProduct PlatformProduct { get; }


        public IPurchasableProduct Product => PlatformProduct;

        public DateTime TransactionDateUtc => RevenueCatResult.StoreTransaction?.PurchaseTime != null
                ? DateTimeOffset.FromUnixTimeMilliseconds(RevenueCatResult.StoreTransaction.PurchaseTime).DateTime
                : default;

        public string PurchaseId => RevenueCatResult.StoreTransaction.OrderId ?? string.Empty;
        public string PurchaseToken => RevenueCatResult?.StoreTransaction?.PurchaseToken ?? string.Empty;

        public PurchaseResult(PurchaseSuccessInfo revenueCatResult, PurchasableProduct platformProduct)
        {
            RevenueCatResult = revenueCatResult;
            PlatformProduct = platformProduct;
            var skuExpirationDate = RevenueCatResult.CustomerInfo.GetExpirationDateForSku(PlatformProduct.PlatformId);

            // skuExpirationDate will be null if no expiration (e.g. lifetime access)
            if (skuExpirationDate == null)
            {
                return;
            }

            ExpirationAt = skuExpirationDate.ToDateTime();
        }
    }
}
