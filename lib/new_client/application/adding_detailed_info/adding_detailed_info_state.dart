part of 'adding_detailed_info_bloc.dart';

@freezed
class AddingDetailedInfoState with _$AddingDetailedInfoState {
  const factory AddingDetailedInfoState({
    /// Detailed information about client.
    required NewClientDetailedInfoModel clientInfo,

    /// Whether any field is filled.
    required bool anyFieldIsNotEmpty,

    /// Status loading data.
    required LoadingStatesWithFailure loadingState,
  }) = _AddingDetailedInfoState;

  /// Initial state.
  factory AddingDetailedInfoState.initial() => AddingDetailedInfoState(
        clientInfo: NewClientDetailedInfoModel.empty(),
        anyFieldIsNotEmpty: false,
        loadingState: LoadingStatesWithFailure.initial,
      );
}
