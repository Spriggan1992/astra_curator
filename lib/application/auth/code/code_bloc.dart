import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'code_event.dart';
part 'code_state.dart';
part 'code_bloc.freezed.dart';

@injectable
class CodeBloc extends Bloc<CodeEvent, CodeState> {
  CodeBloc() : super(CodeState.initial()) {
    on<CodeEvent>((event, emit) async {
      await event.map(
        initialized: (e) async {
          emit(
            state.copyWith(phoneNumber: e.phoneNumber),
          );
        },
        changeCodeValue: (e) async {
          emit(
            state.copyWith(
              code: e.code,
              isShowErrorMessage: false,
              isEnableBtn: state.validatedCode == e.code,
            ),
          );
        },
        onSubmitCode: (e) async {
          if (state.validatedCode == e.code) {
            emit(
              state.copyWith(
                isShowErrorMessage: state.validatedCode != e.code,
                isEnableBtn: true,
              ),
            );
          } else {
            emit(
              state.copyWith(
                isShowErrorMessage: state.validatedCode != e.code,
                isEnableBtn: false,
              ),
            );
          }
        },
      );
    });
  }
}
