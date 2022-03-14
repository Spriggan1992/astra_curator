import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
part 'calendar_range_date.freezed.dart';

/// Represent model(union) CalendarRangeDate for calendar.
@freezed
class CalendarRangeDate with _$CalendarRangeDate {
  const CalendarRangeDate._();

  const factory CalendarRangeDate({
    /// Begin date
    DateTime? beginDate,

    /// End date
    DateTime? endDate,

    /// A flag that filling end date and begin date.
    required bool isFilled,

  }) = _CalendarRangeDate;

  /// Returns formatted begin date.
  String get formattedBeginDate {
    return DateFormat('yyyy-MM-dd').format(beginDate!);
  }

  /// Returns formatted begin date.
  String get formattedEndDate {
    return DateFormat('yyyy-MM-dd').format(endDate!);
  }
}
