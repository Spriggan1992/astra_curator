import 'dart:developer';
import 'dart:io';

import 'package:astra_curator/core/application/enums/astra_failures.dart';
import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
import 'package:astra_curator/core/application/enums/loading_states.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/cached_file_image_model.dart';
import 'package:astra_curator/core/domain/models/child_status_model.dart';
import 'package:astra_curator/core/domain/models/city_model.dart';
import 'package:astra_curator/core/domain/models/country_model.dart';
import 'package:astra_curator/core/domain/models/gender_model.dart';
import 'package:astra_curator/core/domain/models/image_model.dart';
import 'package:astra_curator/core/domain/models/martial_status_model.dart';
import 'package:astra_curator/core/domain/models/new_client_model.dart';
import 'package:astra_curator/core/domain/models/status_model.dart';
import 'package:astra_curator/core/domain/services/i_image_picker_service.dart';
import 'package:astra_curator/new_client/adding_client/domain/i_adding_client_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'adding_client_event.dart';
part 'adding_client_state.dart';
part 'adding_client_bloc.freezed.dart';

@injectable
class AddingClientBloc extends Bloc<AddingClientEvent, AddingClientState> {
  final IAddingClientRepository _repository;
  final IImagePickerService _imagePicker;
  AddingClientBloc(this._repository, this._imagePicker)
      : super(AddingClientState.initial()) {
    on<AddingClientEvent>(
      (event, emit) async {
        await event.map(
          initialized: (e) async {
            add(const AddingClientEvent.citiesLoaded());
            emit(
              state.copyWith(loadingState: LoadingStates.success),
            );
          },
          citiesLoaded: (e) async {
            emit(
              state.copyWith(loadingState: LoadingStates.loading),
            );
            final failureOrCities = await _repository.getCities();
            failureOrCities.fold(
              (failure) => emit(_mapFailure(failure, state)),
              (cities) => add(AddingClientEvent.countriesLoaded(cities)),
            );
          },
          countriesLoaded: (e) async {
            final failureOrCountries = await _repository.getCountries();
            emit(
              failureOrCountries.fold(
                (failure) => _mapFailure(failure, state),
                (countries) => state.copyWith(
                  countries: countries,
                  cities: e.cities,
                  client: state.client.copyWith(
                    city: e.cities.first,
                    country: countries.first,
                    status: const StatusModel(
                      title: 'в активном поиске',
                      value: 1,
                    ),
                  ),
                  loadingState: LoadingStates.success,
                ),
              ),
            );
          },
          phoneNumberChanged: (e) async {
            emit(
              state.copyWith(
                client: state.client.copyWith(
                  phoneNumber: e.phoneNumber,
                ),
              ),
            );
            add(const AddingClientEvent.formIsFilled());
          },
          firstNameChanged: (e) async {
            emit(
              state.copyWith(
                client: state.client.copyWith(
                  firstName: e.firstName,
                ),
              ),
            );
            add(const AddingClientEvent.formIsFilled());
          },
          lastNameChanged: (e) async {
            emit(
              state.copyWith(
                client: state.client.copyWith(
                  lastName: e.lastName,
                ),
              ),
            );
            add(const AddingClientEvent.formIsFilled());
          },
          birthdayChanged: (e) async {
            emit(
              state.copyWith(
                client: state.client.copyWith(
                  birthday: e.birthday,
                ),
              ),
            );
            add(const AddingClientEvent.formIsFilled());
          },
          cityChanged: (e) async {
            emit(
              state.copyWith(
                client: state.client.copyWith(
                  city: e.city,
                ),
              ),
            );
            add(const AddingClientEvent.formIsFilled());
          },
          countryChanged: (e) async {
            emit(
              state.copyWith(
                client: state.client.copyWith(
                  country: e.country,
                ),
              ),
            );
            add(const AddingClientEvent.formIsFilled());
          },
          genderChanged: (e) async {
            emit(
              state.copyWith(
                client: state.client.copyWith(
                  gender: e.gender,
                ),
              ),
            );
            add(const AddingClientEvent.formIsFilled());
          },
          heightChanged: (e) async {
            emit(
              state.copyWith(
                client: state.client.copyWith(
                  height: e.height,
                ),
              ),
            );
            add(const AddingClientEvent.formIsFilled());
          },
          martialStatusChanged: (e) async {
            emit(
              state.copyWith(
                client: state.client.copyWith(
                  martialStatus: e.martialStatus,
                ),
              ),
            );
            log(e.martialStatus.toString(), name: 'martialStatus');
            add(const AddingClientEvent.formIsFilled());
          },
          childStatusChanged: (e) async {
            emit(
              state.copyWith(
                client: state.client.copyWith(
                  haveChild: e.haveChild,
                ),
              ),
            );
            add(const AddingClientEvent.formIsFilled());
          },
          shortDescriptionChanged: (e) async {
            emit(
              state.copyWith(
                client: state.client.copyWith(
                  shortDescription: e.shortDescription,
                ),
              ),
            );
            add(const AddingClientEvent.formIsFilled());
          },
          photosAdded: (e) async {
            final selectedPhoto = await _imagePicker.getImages();
            if (selectedPhoto != null) {
              final fileToImage = selectedPhoto
                  .map(
                    (e) => ImageModel(
                      imageUrl: '',
                      cachedImage: CachedFileImageModel(
                        fullImage: File(e.path),
                        thumbnailImage: File(e.path),
                      ),
                    ),
                  )
                  .toList();
              if (state.photos.length < 3) {
                emit(state.copyWith(photos: [...state.photos, ...fileToImage]));
              } else {
                emit(state.copyWith(photos: fileToImage));
              }
            }
            add(const AddingClientEvent.formIsFilled());
          },
          photosUpdated: (e) async {
            emit(state.copyWith(photos: e.updatedImages));
            add(const AddingClientEvent.formIsFilled());
          },
          formIsFilled: (e) async {
            final formIsFilled =
                state.client.allFieldIsFilled && state.photos.length >= 3;
            emit(state.copyWith(formIsFilled: formIsFilled));
          },
          buttonPressed: (e) async {
            emit(
              state.copyWith(
                registerLoadingStates: LoadingStatesWithFailure.loading,
              ),
            );
            final response = await _repository.registerNewUser(state.client);
            emit(
              response.fold(
                (failure) => failure.map(
                  api: (_) => state.copyWith(
                    registerLoadingStates:
                        LoadingStatesWithFailure.unexpectedFailure,
                  ),
                  noConnection: (_) => state.copyWith(
                    registerLoadingStates:
                        LoadingStatesWithFailure.noConnectionFailure,
                  ),
                ),
                (_) => state.copyWith(
                  registerLoadingStates: LoadingStatesWithFailure.success,
                ),
              ),
            );
          },
        );
      },
    );
  }

  AddingClientState _mapFailure(
    Failure failure,
    AddingClientState state,
  ) {
    return failure.map(
      api: (_) => state.copyWith(
        loadingState: LoadingStates.failure,
        astraFailure: AstraFailures.unexpected,
      ),
      noConnection: (_) => state.copyWith(
        loadingState: LoadingStates.failure,
        astraFailure: AstraFailures.noConnection,
      ),
    );
  }
}
