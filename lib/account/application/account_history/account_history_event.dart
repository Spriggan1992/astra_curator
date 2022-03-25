part of 'account_history_bloc.dart';

@freezed
class AccountHistoryEvent with _$AccountHistoryEvent {
  /// Event to fetch list of account histories.
  const factory AccountHistoryEvent.loadHistories() = LoadHistories;

  /// Event to fetch list of account histories by period.
  const factory AccountHistoryEvent.loadHistoriesByPeriod({
    required CalendarRangeDate rangeDate,
  }) = LoadHistoriesByDate;
}
