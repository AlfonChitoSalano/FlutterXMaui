using AnalyticsMAUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AnalyticsMAUI.Infra
{
    public interface IPurchaseManager
    {
        public Task<IList<IPurchasableProduct>> GetProductsAsync(CancellationToken cancellationToken);
        public Task<IPurchaseResult> PurchaseAsync(IPurchasableProduct product, CancellationToken cancellationToken);
    }
}
