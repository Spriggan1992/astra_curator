import 'package:flutter/material.dart';

/// Represent date picker for android platform.
class AndroidDatePicker extends StatelessWidget {
  /// The initial picked date.
  final DateTime? initialDate;

  /// The date on which the calendar starts.
  final DateTime? firstDate;

  /// The date on which the calendar ends.
  final DateTime? lastDate;

  /// The initial display of the calendar picker.
  final DatePickerMode initialCalendarMode;

  const AndroidDatePicker({
    Key? key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.initialCalendarMode = DatePickerMode.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DatePickerDialog(
      initialCalendarMode: initialCalendarMode,
      initialDate: initialDate ?? DateTime(2015),
      firstDate: firstDate ?? DateTime(1940),
      lastDate: lastDate ?? DateTime(2101),
    );
  }
}
