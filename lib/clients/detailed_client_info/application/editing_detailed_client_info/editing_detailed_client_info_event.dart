part of 'editing_detailed_client_info_bloc.dart';

@freezed
class EditingDetailedClientInfoEvent with _$EditingDetailedClientInfoEvent {
  /// Data loaded event.
  const factory EditingDetailedClientInfoEvent.dataLoaded(int userId) =
      _DataLoaded;
}
