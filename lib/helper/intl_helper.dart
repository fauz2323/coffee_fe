import 'package:intl/intl.dart';

class IntlHelper {
  static convertDateTime(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }
}
