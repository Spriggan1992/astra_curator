import 'package:freezed_annotation/freezed_annotation.dart';
part 'calendar_range_date.freezed.dart';

/// Represent model(union) CalendarRangeDate for calendar.
@freezed
class CalendarRangeDate with _$CalendarRangeDate {
  const CalendarRangeDate._();

  const factory CalendarRangeDate({
    /// Begin date
    required final DateTime? beginDate,
    /// End date
    required final DateTime? endDate,
  }) = _CalendarRangeDate;
}
