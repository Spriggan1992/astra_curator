import 'package:astra_curator/clients/application/clients_sort_types.dart';
import 'package:astra_curator/clients/domain/models/client.dart';
import 'package:astra_curator/clients/domain/repositories/i_client_repository.dart';
import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
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
          emit(
            result.fold(
              (failure) => failure.map(
                api: (e) => state.copyWith(
                  loadingStates: LoadingStatesWithFailure.unexpectedFailure,
                ),
                noConnection: (e) => state.copyWith(
                  loadingStates: LoadingStatesWithFailure.noConnectionFailure,
                ),
              ),
              (clients) => state.copyWith(
                clients: clients,
                loadingStates: LoadingStatesWithFailure.success,
              ),
            ),
          );
        },
        sortClients: (e) async {
          emit(
            state.copyWith(
              loadingStates: LoadingStatesWithFailure.initial,
              sortTypes: SortTypes.initial,
            ),
          );

          final sortedClients =
              await _api.sortClients(e.sortTypes, state.clients);

          await Future.delayed(const Duration(milliseconds: 200));
          emit(
            state.copyWith(
              clients: sortedClients,
              loadingStates: LoadingStatesWithFailure.success,
              sortTypes: e.sortTypes,
            ),
          );
        },
      );
    });
  }
}
