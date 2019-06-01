import 'package:intl/intl.dart';

class Utils {
  static final dateTimeFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ");

  static String getDateTimeForAPI(DateTime dateTime) {
    if (dateTime != null) {
      dateTime = dateTime.toUtc();
      return dateTimeFormat.format(dateTime).toString();
    } else {
      return "";
    }
  }

  static String capitalize(String s) {
    if (s != null && s.isNotEmpty) {
      return s[0].toUpperCase() + s.substring(1);
    } else {
      return "";
    }
  }
}
