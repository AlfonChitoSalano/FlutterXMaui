namespace AnalyticsMAUI.Models
{
    public interface IPurchasableProduct
    {
        string Id { get; }
        string PlatformId { get; }
        long MicrosPrice { get; }
        string CurrencyCode { get; }
        string Title { get; }
        string Price { get; }
        string Description { get; }
    }
}
