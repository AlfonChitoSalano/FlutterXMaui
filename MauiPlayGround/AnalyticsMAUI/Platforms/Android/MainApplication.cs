using AnalyticsMAUI.Infra;
using Android.App;
using Android.Runtime;

namespace AnalyticsMAUI;

[Application]
public class MainApplication : MauiApplication
{
	public MainApplication(IntPtr handle, JniHandleOwnership ownership)
		: base(handle, ownership)
	{
	}

	protected override MauiApp CreateMauiApp()
	{
#if DEBUG
        Com.Revenuecat.Purchases.Purchases.DebugLogsEnabled = true;
#endif
        Com.Revenuecat.Purchases.Purchases.Configure(this, AppConstants.RevenueCatKey);


        return MauiProgram.CreateMauiApp();
    }
}
