import 'package:astra_curator/clients/detailed_client_info/application/editing_detailed_client_info_actor/updated_client_loading_state.dart';
import 'package:astra_curator/clients/detailed_client_info/domain/i_editing_detailed_client_repository.dart';
import 'package:astra_curator/core/application/enums/loading_states.dart';
import 'package:astra_curator/core/domain/models/client_detailed_info_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'editing_detailed_client_info_actor_event.dart';
part 'editing_detailed_client_info_actor_state.dart';
part 'editing_detailed_client_info_actor_bloc.freezed.dart';

@injectable
class EditingDetailedClientInfoActorBloc extends Bloc<
    EditingDetailedClientInfoActorEvent, EditingDetailedClientInfoActorState> {
  final IEditingDetailedClientRepository _repository;
  EditingDetailedClientInfoActorBloc(this._repository)
      : super(EditingDetailedClientInfoActorState.initial()) {
    on<EditingDetailedClientInfoActorEvent>(
      (event, emit) async {
        await event.map(
          initialized: (e) async {
            emit(
              state.copyWith(
                loadingState: LoadingStates.success,
                clientInfo: e.detailedInfoModel,
                userId: e.userId,
              ),
            );
          },
          characterChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(character: e.value),
              ),
            );
          },
          skillsChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(skills: e.value),
              ),
            );
          },
          orientationChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(orientation: e.value),
              ),
            );
          },
          emotionalityChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(emotionality: e.value),
              ),
            );
          },
          intellectualityChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(intellectuality: e.value),
              ),
            );
          },
          sociabilityChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(sociability: e.value),
              ),
            );
          },
          selfRatingChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(selfControl: e.value),
              ),
            );
          },
          volitionallyChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(volitionally: e.value),
              ),
            );
          },
          selfControlChanged: (e) async {
            emit(
              state.copyWith(
                clientInfo: state.clientInfo.copyWith(selfControl: e.value),
              ),
            );
          },
          buttonPressed: (e) async {
            emit(
              state.copyWith(
                clientUpdatedLoadingState: ClientUpdatedLoadingState.loading,
              ),
            );
            final response =
                await _repository.updateClientDetailedInfo(state.userId);
            emit(
              response.fold(
                (failure) => failure.map(
                  api: (_) => state.copyWith(
                    clientUpdatedLoadingState:
                        ClientUpdatedLoadingState.unexpected,
                  ),
                  noConnection: (_) => state.copyWith(
                    clientUpdatedLoadingState:
                        ClientUpdatedLoadingState.noConnection,
                  ),
                ),
                (_) => state.copyWith(
                  clientUpdatedLoadingState: ClientUpdatedLoadingState.success,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
