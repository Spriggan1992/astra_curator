import 'package:astra_curator/domain/my_account/models/withdraw/withdraw_history.dart';
import 'package:astra_curator/domain/my_account/repositories/i_account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'withdraw_history_event.dart';
part 'withdraw_history_state.dart';
part 'withdraw_history_bloc.freezed.dart';


@injectable
class WithdrawHistoryBloc
    extends Bloc<WithdrawHistoryEvent, WithdrawHistoryState> {
  final IAccountRepository _api;

  WithdrawHistoryBloc(this._api) : super(WithdrawHistoryState.initial()) {
    on<WithdrawHistoryEvent>(
      (event, emit) async {
        await event.map(
          loadHistories: (e) async {
            emit(
              state.copyWith(
                isLoading: true,
                histories: [],
              ),
            );
            final result = await _api.getWithdrawHistories();
            result.fold(
              (l) => {
                l.map(
                  api: (e) {
                    emit(
                      state.copyWith(
                        histories: [],
                        isLoading: false,
                        isNoConnection: false,
                        isSuccess: false,
                        isUnExpectedError: true,
                      ),
                    );
                  },
                  noConnection: (e) {
                    emit(
                      state.copyWith(
                        histories: [],
                        isLoading: false,
                        isNoConnection: true,
                        isSuccess: false,
                        isUnExpectedError: false,
                      ),
                    );
                  },
                ),
              },
              (r) => {
                emit(
                  state.copyWith(
                    histories: r,
                    isLoading: false,
                    isNoConnection: false,
                    isSuccess: true,
                    isUnExpectedError: false,
                  ),
                ),
              },
            );
          },
        );
      },
    );
  }
}
