import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Represent extension to convert  dateTime to string.
extension DateTimeOnString on DateTime {
  /// Convert dateTime to local date as [string].
  String dateTimeToStringDateTime(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return DateFormat.yMMMMd(locale).format(this);
  }

  String dateTimeToddMMyyFormat(){
    return DateFormat('dd.MM.yy').format(this); 
  }
  
}
