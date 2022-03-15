import 'package:intl/intl.dart';

/// Represent extension to convert amount to formatted string currency.
extension MoneyFormat on double {
  String formattedAmount() {
    final formatCurrency =NumberFormat('#,##0', 'ru');
    return formatCurrency.format(this);
  }
}
