part of 'app_bar_cubit.dart';

@freezed
class AppBarState with _$AppBarState {
  const factory AppBarState({
    required String title,
  }) = _AppBarState;
  factory AppBarState.initial() => const AppBarState(
        title: '',
      );
}
