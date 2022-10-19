using AnalyticsMAUI.Models;
using AnalyticsMAUI.Infra;
using Com.Revenuecat.Purchases;
using Plugin.CurrentActivity;
using Xamarin.RevenueCat.Android.Extensions;
using Xamarin.RevenueCat.Android.Extensions.Exceptions;

namespace AnalyticsMAUI.Platforms
{
    public class PurchaseManager : PurchaseManagerBase
    {
        private static Purchases RevenueCatInstance => Purchases.SharedInstance;

        public override async Task<IList<IPurchasableProduct>> GetProductsAsync(CancellationToken cancellationToken)
        {
            var offerings = await RevenueCatInstance.GetOfferingsAsync(cancellationToken).ConfigureAwait(false);
            var packages = offerings.Current?.AvailablePackages;
            if (packages == null)
            {
                return new List<IPurchasableProduct>();
            }

            return packages
                .Select(revenueCatPackage => new PurchasableProduct(revenueCatPackage))
                .ToList<IPurchasableProduct>();
        }

        protected override async Task<IPurchaseResult> PlatformPurchaseAsync(IPurchasableProduct product, CancellationToken cancellationToken)
        {
            if (!(product is PurchasableProduct platformProduct))
            {
                throw new ArgumentException("invalid product");
            }

            try
            {
                var revenueCatResult = await RevenueCatInstance.PurchasePackageAsync(
                    CrossCurrentActivity.Current.Activity, platformProduct.RevenueCatPackage, cancellationToken).ConfigureAwait(false);
                return new PurchaseResult(revenueCatResult, platformProduct);
            }
            catch (PurchasesErrorException e)
            {
                if (e.UserCancelled)
                {
                    throw new PurchaseException(PurchaseExceptionType.UserCancelled, false, e,
                        e.PurchasesError.Message);
                }

                var purchasesErrorCode = e.PurchasesError?.Code ?? PurchasesErrorCode.UnknownError;

                throw new PurchaseException(GetExceptionType(purchasesErrorCode),
                    GetIfRetrySuggested(purchasesErrorCode), e, e.Message);
            }
        }

        private static bool GetIfRetrySuggested(PurchasesErrorCode purchasesErrorCode)
        {
            return purchasesErrorCode == PurchasesErrorCode.NetworkError ||
                   purchasesErrorCode == PurchasesErrorCode.StoreProblemError;
        }

        private static PurchaseExceptionType GetExceptionType(PurchasesErrorCode purchasesErrorCode)
        {
            if (purchasesErrorCode == PurchasesErrorCode.IneligibleError)
            {
                return PurchaseExceptionType.IneligibleError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.InsufficientPermissionsError)
            {
                return PurchaseExceptionType.InsufficientPermissionsError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.InvalidAppUserIdError)
            {
                return PurchaseExceptionType.InvalidAppUserIdError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.InvalidAppleSubscriptionKeyError)
            {
                return PurchaseExceptionType.InvalidAppleSubscriptionKeyError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.InvalidCredentialsError)
            {
                return PurchaseExceptionType.InvalidCredentialsError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.InvalidReceiptError)
            {
                return PurchaseExceptionType.InvalidReceiptError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.InvalidSubscriberAttributesError)
            {
                return PurchaseExceptionType.InvalidSubscriberAttributesError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.MissingReceiptFileError)
            {
                return PurchaseExceptionType.MissingReceiptFileError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.NetworkError)
            {
                return PurchaseExceptionType.NetworkError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.OperationAlreadyInProgressError)
            {
                return PurchaseExceptionType.OperationAlreadyInProgressError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.PaymentPendingError)
            {
                return PurchaseExceptionType.PaymentPendingError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.ProductAlreadyPurchasedError)
            {
                return PurchaseExceptionType.ProductAlreadyPurchasedError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.ProductNotAvailableForPurchaseError)
            {
                return PurchaseExceptionType.ProductNotAvailableForPurchaseError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.PurchaseCancelledError)
            {
                return PurchaseExceptionType.PurchaseCancelledError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.PurchaseInvalidError)
            {
                return PurchaseExceptionType.PurchaseInvalidError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.PurchaseNotAllowedError)
            {
                return PurchaseExceptionType.PurchaseNotAllowedError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.ReceiptAlreadyInUseError)
            {
                return PurchaseExceptionType.ReceiptAlreadyInUseError;
            }

            //if (purchasesErrorCode == PurchasesErrorCode.ReceiptInUseByOtherSubscriberError)
            //{
            //    return PurchaseExceptionType.ReceiptInUseByOtherSubscriberError;
            //}

            if (purchasesErrorCode == PurchasesErrorCode.StoreProblemError)
            {
                return PurchaseExceptionType.StoreProblemError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.UnexpectedBackendResponseError)
            {
                return PurchaseExceptionType.UnexpectedBackendResponseError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.UnknownBackendError)
            {
                return PurchaseExceptionType.UnknownBackendError;
            }

            if (purchasesErrorCode == PurchasesErrorCode.UnknownError)
            {
                return PurchaseExceptionType.UnknownError;
            }

            return PurchaseExceptionType.UnknownPurchaseExceptionType;
        }
    }
}
