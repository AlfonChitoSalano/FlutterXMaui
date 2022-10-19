namespace AnalyticsMAUI.Models
{
    public enum PurchaseExceptionType
    {
        UserCancelled,
        IneligibleError,
        InsufficientPermissionsError,
        InvalidAppUserIdError,
        InvalidAppleSubscriptionKeyError,
        InvalidCredentialsError,
        InvalidReceiptError,
        InvalidSubscriberAttributesError,
        MissingReceiptFileError,
        NetworkError,
        OperationAlreadyInProgressError,
        PaymentPendingError,
        ProductAlreadyPurchasedError,
        ProductNotAvailableForPurchaseError,
        PurchaseCancelledError,
        PurchaseInvalidError,
        PurchaseNotAllowedError,
        ReceiptAlreadyInUseError,
        // ReceiptInUseByOtherSubscriberError,
        StoreProblemError,
        UnexpectedBackendResponseError,
        UnknownBackendError,
        UnknownError,
        UnknownPurchaseExceptionType
    }
}
