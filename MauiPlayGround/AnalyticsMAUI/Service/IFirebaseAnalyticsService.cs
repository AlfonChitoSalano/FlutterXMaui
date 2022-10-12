
namespace AnalyticsMAUI.Service
{
    public interface IFirebaseAnalyticsService
    {
        void SendEvent(string eventId);
        void SendEvent(string eventId, string paramName, string value);
        void SendEvent(string eventId, IDictionary<string, string> parameters);
    }
}
