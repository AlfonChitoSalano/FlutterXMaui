using AnalyticsMAUI.Service;

namespace AnalyticsMAUI;

public partial class MainPage : ContentPage
{
    private readonly IFirebaseAnalyticsService _firebaseAnalyticsService;

    public MainPage(IFirebaseAnalyticsService firebaseAnalyticsService)
    {
        InitializeComponent();
        _firebaseAnalyticsService = firebaseAnalyticsService;
    }

    private void ButtonSayHelloClicked(object sender, EventArgs e)
    {
        _firebaseAnalyticsService.SendEvent(nameof(ButtonSayHelloClicked));
    }

    private void ButtonSendCommentsClicked(object sender, EventArgs e)
    {
        _firebaseAnalyticsService.SendEvent(nameof(ButtonSendCommentsClicked), "Comment", "Hello Events");
    }

    private void ButtonSendDictionaryDataClicked(object sender, EventArgs e)
    {
        var dictionary = new Dictionary<string, string>
        {
            {"Name", "Wilson Rey"},
            {"Phone", "55 555 555 555"},
            {"Email", "wilsonrey@yahoo.com.ph"}
        };

        _firebaseAnalyticsService.SendEvent(nameof(ButtonSendDictionaryDataClicked), dictionary);
    }
}