using AnalyticsMAUI.Platforms;
using AnalyticsMAUI.Infra;
using AnalyticsMAUI.Views;

namespace AnalyticsMAUI;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
            });

        //https://console.firebase.google.com for your viewing of custom events
        //need to run to show in debug. Tools - android - android adb command prompt
        //adb shell setprop debug.firebase.analytics.app com.companyname.analyticsmaui
        builder.Services.AddSingleton<IFirebaseAnalyticsService, FirebaseAnalyticsService>();
        builder.Services.AddSingleton<IPurchaseManager, PurchaseManager>();
        builder.Services.AddTransient<HomePage>();
        builder.Services.AddTransient<AnalyticsPage>();
        builder.Services.AddTransient<RevenueCatPage>();
        return builder.Build();
    }
}