import 'package:astra_curator/application/clients/clients_sort_types.dart';
import 'package:astra_curator/domain/clients/models/client.dart';
import 'package:astra_curator/domain/clients/repositories/i_client_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'clients_event.dart';
part 'clients_state.dart';
part 'clients_bloc.freezed.dart';

/// The bloc to load clients from server and sort clients.
@injectable
class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  /// API.
  final IClientRepository _api;

  ClientsBloc(this._api) : super(ClientsState.initial()) {
    on<ClientsEvent>((event, emit) async {
      await event.map(
        loadClients: (e) async {
          final result = await _api.getClients();
          result.fold(
            (l) => {
              l.map(
                api: (e) {
                  emit(
                    state.copyWith(
                      isUnExpectedError: true,
                      isLoading: false,
                    ),
                  );
                },
                noConnection: (e) {
                  emit(
                    state.copyWith(
                      isNoConnection: true,
                      isLoading: false,
                    ),
                  );
                },
              ),
            },
            (clients) => {
              emit(
                state.copyWith(
                  clients: clients,
                  isLoading: false,
                  isSuccess: true,
                ),
              ),
            },
          );
        },
        sortClients: (e) async {
          emit(
            state.copyWith(
              isLoading: true,
              isSuccess: false,
              sortTypes: SortTypes.initial,
            ),
          );

          final sortedClients =
              await _api.sortClients(e.sortTypes, state.clients);

          await Future.delayed(const Duration(seconds: 2));
          emit(
            state.copyWith(
              clients: sortedClients,
              isLoading: false,
              isSuccess: true,
              sortTypes: e.sortTypes,
            ),
          );
        },
      );
    });
  }
}
