import 'package:astra_curator/account/domain/models/account/account.dart';
import 'package:astra_curator/account/domain/repositories/i_account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'account_event.dart';
part 'account_state.dart';
part 'account_bloc.freezed.dart';

/// Account bloc (cashback bloc).
@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final IAccountRepository _api;
  AccountBloc(this._api) : super(AccountState.initial()) {
    on<AccountEvent>(
      (event, emit) async {
        await event.map(
          load: (e) async {
            final result = await _api.getAccountData();
            result.fold(
              (l) {
                l.map(
                  api: (api) => emit(
                    state.copyWith(
                      isUnexpectedError: true,
                      isLoading: false,
                    ),
                  ),
                  noConnection: (e) => emit(
                    state.copyWith(
                      isNoConnection: true,
                      isLoading: false,
                    ),
                  ),
                );
              },
              (account) {
                emit(
                  state.copyWith(
                    account: account,
                    isLoading: false,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
