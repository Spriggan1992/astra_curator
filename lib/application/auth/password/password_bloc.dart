import 'package:astra_curator/domain/auth/models/auth_info.dart';
import 'package:astra_curator/domain/auth/repositories/i_auth_api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'password_event.dart';
part 'password_state.dart';
part 'password_bloc.freezed.dart';

/// Cheсks the password (code) and saves the token if the password is correct.
@injectable
class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final IAuthApiService _apiService;
  PasswordBloc(this._apiService) : super(PasswordState.initial()) {
    on<PasswordEvent>((event, emit) async {
      await event.map(
        initialized: (e) async {
          final isSignIn = e.code == null;
          emit(
            state.copyWith(
              code: e.code,
              phoneNumber: e.phoneNumber.replaceAll(RegExp(r'[^\d]'), ""),
              isSignIn: isSignIn,
            ),
          );
        },
        changedPassword: (e) async {
          final isValid = e.password.length == 4;
          emit(
            state.copyWith(
              password: e.password,
              isEnableBtn: isValid,
              errorMessage: "",
            ),
          );
        },
        pressedButton: (e) async {
          if (state.isSignIn) {
            emit(state.copyWith(isLoading: true));
            final response = await _apiService.signIn(
              AuthInfo(
                phoneNumber: state.phoneNumber.replaceAll(RegExp(r'[^\d]'), ""),
                password: state.password,
              ),
            );
            response.fold(
              (fail) => fail.maybeMap(
                server: (value) => emit(
                  state.copyWith(
                    errorMessage:
                        '${value.message}\nПовторите пожалуйста еще раз.',
                  ),
                ),
                noConnection: (_) => emit(state.copyWith(isNoConnection: true)),
                orElse: () {},
              ),
              (success) => emit(
                state.copyWith(
                  isSuccessfullySignIn: response.isRight(),
                ),
              ),
            );
            emit(
              state.copyWith(
                isLoading: false,
                isNoConnection: false,
                isSuccessfullySignIn: false,
              ),
            );
          } else {
            emit(
              state.copyWith(redirectToConfirmPassword: true),
            );
          }
        },
      );
    });
  }
}
