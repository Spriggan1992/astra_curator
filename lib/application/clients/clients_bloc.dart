import 'package:astra_curator/domain/clients/models/client.dart';
import 'package:astra_curator/domain/clients/repositories/i_client_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'clients_event.dart';
part 'clients_state.dart';
part 'clients_bloc.freezed.dart';

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
                    ),
                  );
                },
                noConnection: (e) {
                  emit(
                    state.copyWith(
                      isNoConnection: true,
                    ),
                  );
                },
              ),
            },
            (clients) => {
              emit(
                state.copyWith(
                  clients: clients,
                ),
              ),
            },
          );
        },
      );
    });
  }
}
