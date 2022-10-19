namespace AnalyticsMAUI.Platforms
{
    public static class JavaDateExtensions
    {
        public static DateTime? ToDateTime(this Java.Util.Date javaUtilDate)
        {
            if (javaUtilDate == null)
            {
                return null;
            }

            return DateTime.UnixEpoch.AddMilliseconds(javaUtilDate.Time);
        }

        public static Java.Util.Date ToJavaUtilDate(this DateTime dateTime)
        {
            var dateTimeUtcAsMilliseconds = (long)(dateTime - DateTime.UnixEpoch).TotalMilliseconds;
            return new Java.Util.Date(dateTimeUtcAsMilliseconds);
        }
    }
}
