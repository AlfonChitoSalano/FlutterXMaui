using AnalyticsMAUI.Infra;
using AnalyticsMAUI.Models;

namespace AnalyticsMAUI.Platforms
{
    public class PurchaseManager : PurchaseManagerBase
    {
        public override Task<IList<IPurchasableProduct>> GetProductsAsync(CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

        protected override Task<IPurchaseResult> PlatformPurchaseAsync(IPurchasableProduct product, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
    }
}
