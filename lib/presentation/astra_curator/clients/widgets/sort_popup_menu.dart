import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Represents popup menu in clients screen.
class SortPopUpMenu extends StatelessWidget {
  const SortPopUpMenu({Key? key, this.onSelected}) : super(key: key);

  /// A Callback handler.
  final PopupMenuItemSelected<int>? onSelected;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return PopupMenuButton<int>(
      offset: const Offset(10, kBottomNavigationBarHeight),
      onSelected: onSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: AstraColors.mainGold),
      ),
      icon: const Icon(Icons.sort, color: AstraColors.black),
      itemBuilder: (context) {
        return [
          PopupMenuItem<int>(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'По последнему входу',
                  style: _textTheme.bodySmall!.copyWith(
                    color: AstraColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  CupertinoIcons.arrow_up_arrow_down,
                  color: AstraColors.black,
                  size: 18,
                ),
              ],
            ),
            value: 1,
          ),
          PopupMenuDivider(height: 10),
          PopupMenuItem<int>(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'По ID',
                  style: _textTheme.bodySmall!.copyWith(
                    color: AstraColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  CupertinoIcons.arrow_up_arrow_down,
                  color: AstraColors.black,
                  size: 18,
                ),
              ],
            ),
            value: 2,
          ),
          PopupMenuDivider(),
          PopupMenuItem(
            child: Center(
              child: Text(
                'По имени А-Я',
                textAlign: TextAlign.center,
                style: _textTheme.bodySmall!.copyWith(
                  color: AstraColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            value: 3,
          ),
          PopupMenuDivider(),
          PopupMenuItem(
            child: Center(
              child: Text(
                'По имени Я-А',
                style: _textTheme.bodySmall!.copyWith(
                  color: AstraColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            value: 4,
          ),
        ];
      },
    );
  }
}
