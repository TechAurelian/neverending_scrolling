import 'package:intl/intl.dart';

class Utils {
  static final NumberFormat _numberFormat = NumberFormat.decimalPattern();

  static String intToCommaSeparatedString(int value) {
    return _numberFormat.format(value);
  }
}
