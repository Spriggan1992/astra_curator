part of 'withdraw_history_bloc.dart';

@freezed
class WithdrawHistoryEvent with _$WithdrawHistoryEvent {
  /// Event to fetch list of account histories.
  const factory WithdrawHistoryEvent.loadHistories() = LoadHistories;

}
