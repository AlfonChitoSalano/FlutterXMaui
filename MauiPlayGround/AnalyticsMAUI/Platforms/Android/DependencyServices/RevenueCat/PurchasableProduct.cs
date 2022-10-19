using AnalyticsMAUI.Models;
using Com.Revenuecat.Purchases;

namespace AnalyticsMAUI.Platforms
{
    public class PurchasableProduct : IPurchasableProduct
    {
        public string Id => RevenueCatPackage?.Identifier ?? string.Empty;

        public string PlatformId => RevenueCatPackage?.Product?.Sku ?? string.Empty;

        public long MicrosPrice => RevenueCatPackage?.Product?.PriceAmountMicros ?? default;

        public string CurrencyCode => RevenueCatPackage?.Product?.PriceCurrencyCode ?? string.Empty;

        public string Title => RevenueCatPackage?.Product.Title ?? string.Empty;

        public string Price => RevenueCatPackage?.Product.Price ?? string.Empty;

        public string Description => RevenueCatPackage?.Product.Description ?? string.Empty;

        public Package RevenueCatPackage { get; }

        public PurchasableProduct(Package revenueCatPackage)
        {
            RevenueCatPackage = revenueCatPackage;
        }
    }
}
