import 'package:astra_curator/account/domain/repositories/i_account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'withdraw_event.dart';
part 'withdraw_state.dart';
part 'withdraw_bloc.freezed.dart';

@injectable
class WithdrawBloc extends Bloc<WithdrawEvent, WithdrawState> {
  final IAccountRepository _api;
  WithdrawBloc(this._api) : super(const WithdrawInitial()) {
    on<WithdrawEvent>(
      (event, emit) async {
        await event.map(
          withdraw: (e) async {
            final result = await _api.withdrawMoney(amount: e.amount);
            result.fold(
              (failure) => {
                failure.map(
                  api: (e) {
                    emit(
                      const WithdrawState.unExpectedError(),
                    );
                  },
                  noConnection: (e) {
                    emit(
                      const WithdrawState.noConnection(),
                    );
                  },
                ),
              },
              (_) => {
                emit(
                  const WithdrawState.success(),
                ),
              },
            );
          },
        );
      },
    );
  }
}
