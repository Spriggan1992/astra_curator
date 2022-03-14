import 'package:astra_curator/domain/core/failure/astra_failure.dart';
import 'package:astra_curator/domain/models/calendar_range_date.dart';
import 'package:astra_curator/domain/my_account/models/account_history/account_history.dart';
import 'package:astra_curator/domain/my_account/repositories/i_account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'account_history_event.dart';
part 'account_history_state.dart';
part 'account_history_bloc.freezed.dart';

@injectable
class AccountHistoryBloc
    extends Bloc<AccountHistoryEvent, AccountHistoryState> {
  final IAccountRepository _api;

  AccountHistoryBloc(this._api) : super(AccountHistoryState.initial()) {
    on<AccountHistoryEvent>(
      (event, emit) async {
        await event.map(
          loadHistories: (e) async {
            emit(
              state.copyWith(
                isLoading: true,
                histories: [],
                isFetchingByPeriod: false,
              ),
            );
            final result = await _api.getHistories();
            _getHistories(event, emit, result, false);
          },
          loadHistoriesbyPeriod: (e) async {
            emit(
              state.copyWith(
                isLoading: true,
                histories: [],
                isFetchingByPeriod: false,
              ),
            );
            await Future.delayed(const Duration(milliseconds: 500), () => true);
            final result = await _api.getHistoriesbyPeriod(
              beginDate: e.rangeDate.formattedBeginDate,
              endDate: e.rangeDate.formattedEndDate,
            );
            _getHistories(event, emit, result, true);
          },
        );
      },
    );
  }

  Future<void> _getHistories(
    AccountHistoryEvent event,
    Emitter<AccountHistoryState> emmitter,
    Either<AstraFailure, List<AccountHistory>> result,
    bool isFetchingByPeriod,
  ) async {
    result.fold(
      (l) => {
        l.map(
          api: (e) {
            emmitter(
              state.copyWith(
                histories: [],
                isLoading: false,
                isNoConnection: false,
                isSuccess: false,
                isUnExpectedError: true,
                isFetchingByPeriod: isFetchingByPeriod,
              ),
            );
          },
          noConnection: (e) {
            emmitter(
              state.copyWith(
                histories: [],
                isLoading: false,
                isNoConnection: true,
                isSuccess: false,
                isUnExpectedError: false,
                isFetchingByPeriod: isFetchingByPeriod,
              ),
            );
          },
        ),
      },
      (r) => {
        emmitter(
          state.copyWith(
            histories: r,
            isLoading: false,
            isNoConnection: false,
            isSuccess: true,
            isUnExpectedError: false,
            isFetchingByPeriod: isFetchingByPeriod,
          ),
        ),
      },
    );
  }
}
