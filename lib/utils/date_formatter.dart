import 'package:intl/intl.dart';

class DateFormatter {
  static String format(DateTime? date) {
    if (date == null) return "";

    return DateFormat("EEEE, MMM dd yyyy").format(date);
  }
}