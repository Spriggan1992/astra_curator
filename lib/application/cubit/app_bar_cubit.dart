import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_bar_state.dart';
part 'app_bar_cubit.freezed.dart';

@injectable
class AppBarCubit extends Cubit<AppBarState> {
  AppBarCubit() : super(AppBarState.initial());

  void setAppBarTitle(String value) {
    emit(state.copyWith(title: value));
  }
}
