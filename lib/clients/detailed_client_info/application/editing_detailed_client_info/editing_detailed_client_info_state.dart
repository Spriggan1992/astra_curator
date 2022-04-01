part of 'editing_detailed_client_info_bloc.dart';

@freezed
class EditingDetailedClientInfoState with _$EditingDetailedClientInfoState {
  /// State of initial loading.
  const factory EditingDetailedClientInfoState.initial() = _Initial;

  /// Progress loading states.
  const factory EditingDetailedClientInfoState.loading() = _Loading;

  /// Successfully loaded data state.
  const factory EditingDetailedClientInfoState.success(
    ClientDetailedInfoModel detailedInfo,
  ) = _Success;

  /// Unsuccessfully loaded data state.
  const factory EditingDetailedClientInfoState.failure(Failure failure) =
      _Failure;
}
