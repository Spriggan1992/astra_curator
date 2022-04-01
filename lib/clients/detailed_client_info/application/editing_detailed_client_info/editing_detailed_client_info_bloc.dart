import 'package:astra_curator/clients/detailed_client_info/domain/i_editing_detailed_client_repository.dart';
import 'package:astra_curator/core/domain/failure/failure.dart';
import 'package:astra_curator/core/domain/models/client_detailed_info_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'editing_detailed_client_info_event.dart';
part 'editing_detailed_client_info_state.dart';
part 'editing_detailed_client_info_bloc.freezed.dart';

@injectable
class EditingDetailedClientInfoBloc extends Bloc<EditingDetailedClientInfoEvent,
    EditingDetailedClientInfoState> {
  final IEditingDetailedClientRepository _repository;
  EditingDetailedClientInfoBloc(this._repository)
      : super(const EditingDetailedClientInfoState.initial()) {
    on<EditingDetailedClientInfoEvent>((event, emit) async {
      await event.map(
        dataLoaded: (e) async {
          emit(const EditingDetailedClientInfoState.loading());
          final response = await _repository.fetchClientDetailedInfo(e.userId);
          emit(
            response.fold(
              (failure) => EditingDetailedClientInfoState.failure(failure),
              (model) => EditingDetailedClientInfoState.success(model),
            ),
          );
        },
      );
    });
  }
}
