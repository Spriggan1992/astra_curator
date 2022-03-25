import 'package:freezed_annotation/freezed_annotation.dart';
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
}
