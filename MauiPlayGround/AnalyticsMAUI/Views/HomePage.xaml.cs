using AnalyticsMAUI.Infra;
using AnalyticsMAUI.ViewModels;

namespace AnalyticsMAUI.Views;

public partial class HomePage : ContentPage
{
    private readonly IFirebaseAnalyticsService _firebaseAnalyticsService;
	private readonly IPurchaseManager _purchaseManager;

    public HomePage(IFirebaseAnalyticsService firebaseAnalyticsService, IPurchaseManager purchaseManager)
	{
		try
		{
            InitializeComponent();
            _firebaseAnalyticsService = firebaseAnalyticsService;
            _purchaseManager = purchaseManager;
        }
		catch (Exception ex)
		{
			Console.WriteLine(ex.Message);
		}
	}

	private async void NavigateToAnalyticsButton_Tapped(object sender, EventArgs e)
	{
		await Navigation.PushAsync(new AnalyticsPage(_firebaseAnalyticsService));
	}

    private async void NavigateToRevenueCatButton_Tapped(object sender, EventArgs e)
    {
		await Navigation.PushAsync(new RevenueCatPage { BindingContext = new RevenueCatPageViewModel(_purchaseManager) });
    }
}