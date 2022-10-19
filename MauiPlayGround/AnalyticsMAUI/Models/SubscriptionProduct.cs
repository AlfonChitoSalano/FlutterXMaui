namespace AnalyticsMAUI.Models
{
    public class SubscriptionProduct : IPurchasableProduct
    {
        public string Id { get; set; }

        public string PlatformId { get; set; }

        public long MicrosPrice { get; set; }

        public string CurrencyCode { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public string Price { get; set; }
    }
}
