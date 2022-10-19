using AnalyticsMAUI.Infra;

namespace AnalyticsMAUI.Views;

public partial class AnalyticsPage : ContentPage
{
    private readonly IFirebaseAnalyticsService _firebaseAnalyticsService;

    public AnalyticsPage(IFirebaseAnalyticsService firebaseAnalyticsService)
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
            {"Name", "Wilson Abad"},
            {"Phone", "55 555 555 555"},
            {"Email", "abad@yahoo.com.ph"}
        };

        _firebaseAnalyticsService.SendEvent(nameof(ButtonSendDictionaryDataClicked), dictionary);
    }
}