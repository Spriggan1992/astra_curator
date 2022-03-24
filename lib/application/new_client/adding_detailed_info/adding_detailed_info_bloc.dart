import 'package:astra_curator/application/core/enums/loading_state_with_failures.dart';
import 'package:astra_curator/domain/adiing_detailed_info/i_adding_detailed_info_repository.dart';
import 'package:astra_curator/domain/core/models/new_client_detailed_info_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'adding_detailed_info_event.dart';
part 'adding_detailed_info_state.dart';
part 'adding_detailed_info_bloc.freezed.dart';

@injectable
class AddingDetailedInfoBloc
    extends Bloc<AddingDetailedInfoEvent, AddingDetailedInfoState> {
  final IAddingDetailedInfoRepository _repository;
  AddingDetailedInfoBloc(this._repository)
      : super(AddingDetailedInfoState.initial()) {
    on<AddingDetailedInfoEvent>(
      (event, emit) async {
        await event.map(
          characterChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(character: e.value),
              ),
            );
            add(const AddingDetailedInfoEvent.anyFieldIsNotEmptyChecked());
          },
          skillsChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(skills: e.value),
              ),
            );
            add(const AddingDetailedInfoEvent.anyFieldIsNotEmptyChecked());
          },
          orientationChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(orientation: e.value),
              ),
            );
            add(const AddingDetailedInfoEvent.anyFieldIsNotEmptyChecked());
          },
          emotionalityChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(emotionality: e.value),
              ),
            );
            add(const AddingDetailedInfoEvent.anyFieldIsNotEmptyChecked());
          },
          intellectualityChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(intellectuality: e.value),
              ),
            );
            add(const AddingDetailedInfoEvent.anyFieldIsNotEmptyChecked());
          },
          sociabilityChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(sociability: e.value),
              ),
            );
            add(const AddingDetailedInfoEvent.anyFieldIsNotEmptyChecked());
          },
          selfRatingChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(selfControl: e.value),
              ),
            );
            add(const AddingDetailedInfoEvent.anyFieldIsNotEmptyChecked());
          },
          volitionallyChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(volitionally: e.value),
              ),
            );
            add(const AddingDetailedInfoEvent.anyFieldIsNotEmptyChecked());
          },
          selfControlChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(selfControl: e.value),
              ),
            );
            add(const AddingDetailedInfoEvent.anyFieldIsNotEmptyChecked());
          },
          anyFieldIsNotEmptyChecked: (e) async {
            emit(
              state.copyWith(
                anyFieldIsNotEmpty: state.clientInfo.anyFieldIsNotEmpty,
              ),
            );
          },
          buttonPressed: (e) async {
            emit(
              state.copyWith(loadingState: LoadingStatesWithFailure.loading),
            );
            final response =
                await _repository.addClientDetailedInfo(state.clientInfo);
            emit(
              response.fold(
                (failure) => failure.map(
                  api: (_) => state.copyWith(
                    loadingState: LoadingStatesWithFailure.unexpectedFailure,
                  ),
                  noConnection: (_) => state.copyWith(
                    loadingState: LoadingStatesWithFailure.noConnectionFailure,
                  ),
                ),
                (_) => state.copyWith(
                  loadingState: LoadingStatesWithFailure.success,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
