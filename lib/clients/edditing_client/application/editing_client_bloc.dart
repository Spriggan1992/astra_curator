import 'package:astra_curator/clients/clients/domain/models/client.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/city_model.dart';
import 'package:astra_curator/core/domain/models/country_model.dart';
import 'package:astra_curator/core/domain/models/new_client_model.dart';
import 'package:astra_curator/new_client/adding_client/domain/i_adding_client_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'editing_client_event.dart';
part 'editing_client_state.dart';
part 'editing_client_bloc.freezed.dart';

@injectable
class EditingClientBloc extends Bloc<EditingClientEvent, EditingClientState> {
  final IAddingClientRepository _addingClientRepo;
  EditingClientBloc(this._addingClientRepo)
      : super(const EditingClientState.initial()) {
    on<EditingClientEvent>(
      (event, emit) async {
        await event.map(
          initialized: (e) async {
            final failureOrCities = await _addingClientRepo.getCities();
            List<CityModel> _cities = [];
            failureOrCities.fold(
              (failure) => emit(_mapFailure(failure, state)),
              (cities) => _cities = cities,
            );
            final failureOrCountries = await _addingClientRepo.getCountries();
            List<CountryModel> _countries = [];

            failureOrCountries.fold(
              (failure) => emit(_mapFailure(failure, state)),
              (countries) => _countries = countries,
            );
            final _client = NewClientModel.fromClient(
              e.client,
              _cities,
              _countries,
            );
            emit(
              EditingClientState.success(
                _client,
                _cities,
                _countries,
              ),
            );
          },
        );
      },
    );
  }
  EditingClientState _mapFailure(
    Failure failure,
    EditingClientState state,
  ) {
    return failure.map(
      api: (failure) => EditingClientState.failure(failure),
      noConnection: (_) => EditingClientState.failure(failure),
    );
  }
}
