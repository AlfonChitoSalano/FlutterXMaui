using AnalyticsMAUI.Models;
using AnalyticsMAUI.Infra;
using System.Collections.ObjectModel;
using System.Windows.Input;

namespace AnalyticsMAUI.ViewModels
{
    //configure in app products https://www.revenuecat.com/docs/android-products
    public class RevenueCatPageViewModel : ViewModelBase
    {
        private readonly IPurchaseManager _purchaseManager;
        private List<IPurchasableProduct> _purchasableProducts;

        private ObservableCollection<SubscriptionProduct> _products = new();

        public ObservableCollection<SubscriptionProduct> Products
        {
            get => _products;
            set
            {
                _products = value;
                OnPropertyChanged();
            }
        }

        public ICommand GetInAppProductsCommand => new Command(async () => await GetInAppProductsAsync());

        public ICommand PurchaseInAppProductsCommand
            => new Command<SubscriptionProduct>(async (product) => await PurchaseSubscriptionAsync(product));

        public RevenueCatPageViewModel(IPurchaseManager purchaseManager)
        {
            _purchaseManager = purchaseManager;
        }

        private async Task GetInAppProductsAsync()
        {
            _purchasableProducts = (await _purchaseManager.GetProductsAsync(new CancellationToken())).ToList();

            var subscriptionProducts
                = _purchasableProducts.Select(p => new SubscriptionProduct
                {
                    Id = p.Id,
                    CurrencyCode = p.CurrencyCode,
                    MicrosPrice = p.MicrosPrice,
                    PlatformId = p.PlatformId,
                    Price = p.Price,
                    Title = p.Title,
                    Description = p.Description
                });

            Products = new ObservableCollection<SubscriptionProduct>(subscriptionProducts);
        }

        private async Task PurchaseSubscriptionAsync(SubscriptionProduct subscriptionProducts)
        {
            try
            {
                try
                {
                    var selectedProduct = _purchasableProducts.Single(x => x.Id == subscriptionProducts.Id);
                    await _purchaseManager.PurchaseAsync(selectedProduct, CancellationToken.None).ConfigureAwait(false);
                }
                catch (OperationCanceledException)
                {
                    //suppress
                }
                catch (PurchaseException e)
                {
                    Console.WriteLine(e.Message);

                    if (e.ExceptionType != PurchaseExceptionType.UserCancelled)
                    {
                        throw;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}