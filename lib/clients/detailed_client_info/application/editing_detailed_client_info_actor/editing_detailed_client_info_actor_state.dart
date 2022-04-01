part of 'editing_detailed_client_info_actor_bloc.dart';

@freezed
class EditingDetailedClientInfoActorState
    with _$EditingDetailedClientInfoActorState {
  const factory EditingDetailedClientInfoActorState({
    /// State f loading data.
    required LoadingStates loadingState,

    /// Detailed information about client.
    required ClientDetailedInfoModel clientInfo,

    /// Update client loading state.
    required ClientUpdatedLoadingState clientUpdatedLoadingState,

    /// Client identifier.
    required int userId,
  }) = _EditingDetailedClientInfoActorState;
  factory EditingDetailedClientInfoActorState.initial() =>
      EditingDetailedClientInfoActorState(
        loadingState: LoadingStates.initial,
        clientInfo: ClientDetailedInfoModel.empty(),
        clientUpdatedLoadingState: ClientUpdatedLoadingState.initial,
        userId: 0,
      );
}
