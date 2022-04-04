import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
import 'package:astra_curator/core/domain/models/pagination_model.dart';
import 'package:astra_curator/core/domain/services/i_pagination_service.dart';
import 'package:astra_curator/core/infrastructure/http/endpoints.dart';
import 'package:astra_curator/core/infrastructure/services/pagination_service/pagination_config.dart';
import 'package:astra_curator/core/infrastructure/services/pagination_service/pagination_service.dart';
import 'package:astra_curator/injection.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_event.dart';
part 'pagination_state.dart';
part 'pagination_bloc.freezed.dart';

class PaginationBloc<T> extends Bloc<PaginationEvent, PaginationState<T>> {
  final IPaginationService _paginationService = PaginationService(getIt<Dio>());
  PaginationBloc() : super(PaginationState.initial()) {
    on<PaginationEvent>((event, emit) async {
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
          final result = await _paginationService.fetchData<T>(
            state.paginationModel,
            PaginationConfig(
              url: Endpoints.clients.profiles,
            ),
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
      );
    });
  }
}
