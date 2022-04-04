import 'dart:async';
import 'dart:io';

import 'package:astra_curator/core/application/enums/loading_states.dart';
import 'package:astra_curator/core/domain/models/cached_file_image_model.dart';
import 'package:astra_curator/core/domain/models/child_status_model.dart';
import 'package:astra_curator/core/domain/models/city_model.dart';
import 'package:astra_curator/core/domain/models/country_model.dart';
import 'package:astra_curator/core/domain/models/gender_model.dart';
import 'package:astra_curator/core/domain/models/image_model.dart';
import 'package:astra_curator/core/domain/models/martial_status_model.dart';
import 'package:astra_curator/core/domain/models/new_client_model.dart';
import 'package:astra_curator/core/domain/services/i_image_picker_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'editing_client_actor_event.dart';
part 'editing_client_actor_state.dart';
part 'editing_client_actor_bloc.freezed.dart';

@injectable
class EditingClientActorBloc
    extends Bloc<EditingClientActorEvent, EditingClientActorState> {
  final IImagePickerService _imagePicker;
  EditingClientActorBloc(this._imagePicker)
      : super(EditingClientActorState.initial()) {
    on<EditingClientActorEvent>(
      (event, emit) async {
        await event.map(
          initialized: (e) async {
            emit(
              state.copyWith(
                client: e.client,
                updatedClient: e.client,
                loadingState: LoadingStates.success,
              ),
            );
          },
          editingModeToggled: (e) async {
            emit(state.copyWith(canSubmit: !state.canSubmit));
          },
          phoneNumberChanged: (e) async {
            emit(
              state.copyWith(
                updatedClient: state.updatedClient.copyWith(
                  phoneNumber: e.phoneNumber,
                ),
              ),
            );
            add(const EditingClientActorEvent.formValidated());
          },
          firstNameChanged: (e) async {
            emit(
              state.copyWith(
                updatedClient: state.updatedClient.copyWith(
                  firstName: e.firstName,
                ),
              ),
            );
          },
          lastNameChanged: (e) async {
            emit(
              state.copyWith(
                updatedClient: state.updatedClient.copyWith(
                  lastName: e.lastName,
                ),
              ),
            );
            add(const EditingClientActorEvent.formValidated());
          },
          birthdayChanged: (e) async {
            emit(
              state.copyWith(
                updatedClient: state.updatedClient.copyWith(
                  birthday: e.birthday,
                ),
              ),
            );
          },
          cityChanged: (e) async {
            emit(
              state.copyWith(
                updatedClient: state.updatedClient.copyWith(
                  city: e.city,
                ),
              ),
            );
          },
          countryChanged: (e) async {
            emit(
              state.copyWith(
                updatedClient: state.updatedClient.copyWith(
                  country: e.country,
                ),
              ),
            );
            add(const EditingClientActorEvent.formValidated());
          },
          genderChanged: (e) async {
            emit(
              state.copyWith(
                updatedClient: state.updatedClient.copyWith(
                  gender: e.gender,
                ),
              ),
            );
            add(const EditingClientActorEvent.formValidated());
          },
          heightChanged: (e) async {
            emit(
              state.copyWith(
                updatedClient: state.updatedClient.copyWith(
                  height: e.height,
                ),
              ),
            );
            add(const EditingClientActorEvent.formValidated());
          },
          martialStatusChanged: (e) async {
            emit(
              state.copyWith(
                updatedClient: state.updatedClient.copyWith(
                  martialStatus: e.martialStatus,
                ),
              ),
            );
            add(const EditingClientActorEvent.formValidated());
          },
          childStatusChanged: (e) async {
            emit(
              state.copyWith(
                updatedClient: state.updatedClient.copyWith(
                  haveChild: e.haveChild,
                ),
              ),
            );
            add(const EditingClientActorEvent.formValidated());
          },
          shortDescriptionChanged: (e) async {
            emit(
              state.copyWith(
                updatedClient: state.updatedClient.copyWith(
                  shortDescription: e.shortDescription,
                ),
              ),
            );
            add(const EditingClientActorEvent.formValidated());
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
              if (state.client.photos.length < 3) {
                emit(
                  state.copyWith(
                    client: state.client.copyWith(
                      photos: [...state.client.photos, ...fileToImage],
                    ),
                  ),
                );
              } else {
                emit(
                  state.copyWith(
                    client: state.client.copyWith(photos: fileToImage),
                  ),
                );
              }
            }
            add(const EditingClientActorEvent.formValidated());
          },
          photosUpdated: (e) async {
            emit(
              state.copyWith(
                client: state.client.copyWith(photos: e.updatedImages),
              ),
            );
            add(const EditingClientActorEvent.formValidated());
          },
          formValidated: (e) async {
            final formIsValid = state.updatedClient.formIsValid;
            emit(state.copyWith(formIsValid: formIsValid));
          },
          updatedClientSubmitted: (e) async {
            emit(state.copyWith(loadingState: LoadingStates.loading));
            await Future.delayed(const Duration(milliseconds: 1000));
            emit(
              state.copyWith(
                client: state.updatedClient.copyWith(),
                loadingState: LoadingStates.success,
                canSubmit: false,
              ),
            );
          },
        );
      },
    );
  }
}
