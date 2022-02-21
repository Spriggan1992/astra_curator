import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Represent main appbar of app.
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The primary title displayed in the app bar.
  final String? title;

  /// A list of Widgets to display in a row after the [title] widget.
  final List<Widget>? actions;

  /// The appbar background color.
  final Color? bgColor;

  /// The leading icon color.
  final Color? iconColor;

  /// The z-coordinate at which to place this app bar relative to its parent.
  final double? elevation;

  /// The leading icon click event handler.
  final Function()? onPressed;

  const MainAppBar({
    Key? key,
    this.title,
    this.onPressed,
    this.actions,
    this.bgColor,
    this.iconColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: (bgColor == null) ? Colors.white : bgColor,
      leading: onPressed == null
          ? null
          : IconButton(
              onPressed: onPressed,
              icon: Icon(
                CupertinoIcons.back,
                color: (iconColor == null)
                    ? const Color.fromRGBO(176, 176, 176, 1)
                    : iconColor,
                size: 25,
              ),
            ),
      title: Text(
        title ?? '',
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
