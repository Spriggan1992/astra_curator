import 'package:flutter/cupertino.dart';

/// Represent the date picker for ios.
class IOSDatePicker extends StatelessWidget {
  /// The initial picked date.
  final DateTime? initialDate;

  /// The date on which the calendar starts.
  final DateTime? firstDate;

  /// The date on which the calendar ends.
  final DateTime? lastDate;

  /// The callback called when the selected date and/or time changes.
  final void Function(DateTime) onDateTimeChanged;

  const IOSDatePicker({
    Key? key,
    required this.onDateTimeChanged,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoDatePicker(
      initialDateTime: initialDate ?? DateTime(2015),
      minimumDate: firstDate ?? DateTime(1940),
      maximumDate: lastDate ?? DateTime(2101),
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: onDateTimeChanged,
    );
  }
}
