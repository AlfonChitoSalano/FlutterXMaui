using AnalyticsMAUI.Models;

namespace AnalyticsMAUI.Infra
{
    public abstract class PurchaseManagerBase : IPurchaseManager
    {
        public abstract Task<IList<IPurchasableProduct>> GetProductsAsync(CancellationToken cancellationToken);

        public async Task<IPurchaseResult> PurchaseAsync(IPurchasableProduct product, CancellationToken cancellationToken)
        {
            try
            {
                return await PlatformPurchaseAsync(product, cancellationToken).ConfigureAwait(false);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;
            }
        }

        protected abstract Task<IPurchaseResult> PlatformPurchaseAsync(IPurchasableProduct product,
            CancellationToken cancellationToken);
    }
}
