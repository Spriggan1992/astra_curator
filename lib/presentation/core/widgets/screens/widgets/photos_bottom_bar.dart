import 'package:astra_curator/application/photos/photos_bloc.dart';
import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/widgets/buttons/dialog_action_button.dart';
import 'package:astra_curator/presentation/core/widgets/dialogs/dialog_two_actions.dart';
import 'package:astra_curator/presentation/core/widgets/screens/widgets/photos_main_photo_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent bottom bar for [PhotosScreen].
class PhotosBottomBar extends StatelessWidget {
  /// Whether the photos's screen bottom bar is hidden.
  final bool isHideBar;

  /// Photo delete event handler.
  final VoidCallback onDelete;

  const PhotosBottomBar({
    Key? key,
    required this.isHideBar,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: AnimatedOpacity(
        opacity: isHideBar ? 0 : 1,
        duration: const Duration(milliseconds: 100),
        child: Container(
          color: const Color.fromRGBO(0, 0, 0, 0.2),
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<PhotosBloc, PhotosState>(
                buildWhen: (p, c) =>
                    p.currentImageIndex != c.currentImageIndex ||
                    p.mainPhoto != c.mainPhoto,
                builder: (context, state) {
                  return Expanded(
                    flex: 2,
                    child: PhotosMainPhotoButton(
                      isMain: state.mainPhoto == state.currentImageIndex,
                    ),
                  );
                },
              ),
              VerticalDivider(
                color: Theme.of(context)
                    .dividerTheme
                    .copyWith(color: AstraColors.white03)
                    .color,
                endIndent: 8,
                indent: 8,
              ),
              Expanded(
                flex: 2,
                child: IconButton(
                  onPressed: isHideBar
                      ? null
                      : () async {
                          await showDialog(
                            context: context,
                            builder: (
                              BuildContext showDialogContext,
                            ) {
                              return DialogTwoActions(
                                content: const Text(
                                  "Вы точно хотите удалить\nфотографию?",
                                  textAlign: TextAlign.center,
                                ),
                                action1: DialogActionButton(
                                  title: 'Отмена',
                                  onClick: () =>
                                      showDialogContext.popRoute(false),
                                ),
                                action2: DialogActionButton(
                                  title: 'Удалить',
                                  onClick: () {
                                    onDelete();
                                    showDialogContext.router.pop();
                                  },
                                  buttonStyle: TextButton.styleFrom(
                                    primary: AstraColors.red,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
