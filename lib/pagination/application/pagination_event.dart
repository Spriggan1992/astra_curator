part of 'pagination_bloc.dart';

@freezed
class PaginationEvent with _$PaginationEvent {
  const factory PaginationEvent.loadClients({required bool isRefreshItems}) =
      _LoadClients;
}
