import 'dart:async';

import 'package:astra_curator/clients/clients/application/clients_sort_types.dart';
import 'package:astra_curator/clients/clients/domain/models/client.dart';
import 'package:astra_curator/clients/clients/domain/repositories/i_client_repository.dart';
import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
import 'package:astra_curator/core/domain/models/pagination_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'clients_event.dart';
part 'clients_state.dart';
part 'clients_bloc.freezed.dart';

/// The bloc to load clients from server and sort clients.
@injectable
class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  final IClientRepository _apiClient;
  ClientsBloc(this._apiClient) : super(ClientsState.initial()) {
    on<ClientsEvent>((event, emit) async {
      await event.map(
        loadClients: (e) async {
          emit(state.copyWith(isAvailableToLoad: false));
          if (e.isRefreshItems) {
            emit(
              state.copyWith(
                paginationModel: PaginationDataModel.empty(),
                loadingStates: LoadingStatesWithFailure.loading,
              ),
            );
          }
          final result = await _apiClient.getClients(
            state.paginationModel,
          );
          result.fold(
            (failure) => emit(
              failure.map(
                api: (e) => state.copyWith(
                  loadingStates: LoadingStatesWithFailure.unexpectedFailure,
                ),
                noConnection: (e) => state.copyWith(
                  loadingStates: LoadingStatesWithFailure.noConnectionFailure,
                ),
              ),
            ),
            (paginationModel) {
              if (paginationModel != null) {
                return emit(
                  state.copyWith(
                    loadingStates: LoadingStatesWithFailure.success,
                    paginationModel: paginationModel.copyWith(
                      items: [
                        ...?state.paginationModel.items,
                        ...?paginationModel.items
                      ],
                    ),
                    isAvailableToLoad: true,
                  ),
                );
              } else {
                emit(state.copyWith(isAvailableToLoad: true));
              }
            },
          );
        },
        sortClients: (e) async {
          emit(
            state.copyWith(
              loadingStates: LoadingStatesWithFailure.initial,
              sortTypes: SortTypes.initial,
            ),
          );
          final sortedItems =
              await _sortItems(e.sortTypes, state.paginationModel);
          await Future.delayed(const Duration(milliseconds: 200));
          emit(
            state.copyWith(
              paginationModel: sortedItems,
              loadingStates: LoadingStatesWithFailure.success,
              sortTypes: e.sortTypes,
            ),
          );
        },
      );
    });
  }
  Future<PaginationDataModel<List<ClientModel>>> _sortItems(
    SortTypes sortTypes,
    PaginationDataModel<List<ClientModel>> model,
  ) async {
    if (sortTypes == SortTypes.sortByDate) {
      /// TODO finish when API will be ready.
      return model;
    } else if (sortTypes == SortTypes.sortById) {
      model.items!.sort((a, b) => a.id.compareTo(b.id));
      return model;
    } else if (sortTypes == SortTypes.sortByNameAscending) {
      model.items!.sort((a, b) => a.firstName.compareTo(b.firstName));
      return model;
    } else if (sortTypes == SortTypes.sortByNameDescending) {
      model.items!.sort((a, b) => b.firstName.compareTo(a.firstName));
      return model;
    } else {
      return model;
    }
  }
}
