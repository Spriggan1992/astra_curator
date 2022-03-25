import 'package:astra_curator/clients/presentation/clients_screen/constants/clients_texts.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
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
            value: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ClientsTexts.sortByLastLogin,
                  style: _textTheme.bodySmall!.copyWith(
                    color: AstraColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  CupertinoIcons.arrow_up_arrow_down,
                  color: AstraColors.black,
                  size: 18,
                ),
              ],
            ),
          ),
          const PopupMenuDivider(height: 10),
          PopupMenuItem<int>(
            value: 2,
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
                const SizedBox(width: 8),
                const Icon(
                  CupertinoIcons.arrow_up_arrow_down,
                  color: AstraColors.black,
                  size: 18,
                ),
              ],
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            value: 3,
            child: Center(
              child: Text(
                ClientsTexts.sortByAlphabeticOrder,
                textAlign: TextAlign.center,
                style: _textTheme.bodySmall!.copyWith(
                  color: AstraColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            value: 4,
            child: Center(
              child: Text(
                ClientsTexts.sortByAlphabeticOrderReversed,
                style: _textTheme.bodySmall!.copyWith(
                  color: AstraColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
