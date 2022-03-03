import 'package:astra_curator/domain/auth/repositories/i_auth_api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'phone_event.dart';
part 'phone_state.dart';
part 'phone_bloc.freezed.dart';

@injectable
class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  final IAuthApiService _apiService;
  PhoneBloc(this._apiService) : super(PhoneState.initial()) {
    on<PhoneEvent>((event, emit) async {
      await event.map(
        initialized: (e) async {
          emit(
            state.copyWith(
              isEnableBtn: false,
              phoneNumber: "",
              redirectConfirmCode: false,
              redirectToPasswordScreen: false,
            ),
          );
        },
        changedTextValue: (e) async {
          emit(
            state.copyWith(
              phoneNumber: e.value,
              isEnableBtn: e.value.length == 11,
              redirectConfirmCode: false,
              redirectToPasswordScreen: false,
            ),
          );
        },
        pressedBtn: (e) async {
          emit(state.copyWith(isLoading: true));
          final hasAlreadyRegistered = await _apiService.checkPhoneNumber(
            state.phoneNumber,
          );
          emit(
            hasAlreadyRegistered.fold(
              (failure) => failure.maybeWhen(
                noConnection: () => state.copyWith(
                  isNoConnection: true,
                ),
                orElse: () => state.copyWith(
                  redirectConfirmCode: true,
                ),
              ),
              (success) => state.copyWith(
                redirectToPasswordScreen: success,
              ),
            ),
          );
          emit(
            state.copyWith(
              isEnableBtn: state.phoneNumber.length == 11,
              phoneNumber: state.phoneNumber,
              redirectConfirmCode: false,
              redirectToPasswordScreen: false,
              isNoConnection: false,
              isLoading: false,
            ),
          );
        },
      );
    });
  }
}
