using AnalyticsMAUI.Service;

namespace AnalyticsMAUI.Platforms
{
    public class FirebaseAnalyticsService : IFirebaseAnalyticsService
    {
        public void SendEvent(string eventId)
        {
            throw new NotImplementedException();
        }

        public void SendEvent(string eventId, string paramName, string value)
        {
            throw new NotImplementedException();
        }

        public void SendEvent(string eventId, IDictionary<string, string> parameters)
        {
            throw new NotImplementedException();
        }
    }
}
