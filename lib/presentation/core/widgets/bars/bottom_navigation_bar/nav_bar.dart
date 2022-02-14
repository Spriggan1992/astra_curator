import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/theming/gradients.dart';
import 'package:astra_curator/presentation/core/widgets/bars/bottom_navigation_bar/i_nav_item.dart';
import 'package:astra_curator/presentation/core/widgets/bars/bottom_navigation_bar/icon_nav_item.dart';
import 'package:astra_curator/presentation/core/widgets/bars/bottom_navigation_bar/svg_nav_item.dart';
import 'package:astra_curator/presentation/core/widgets/icons/svg_icon.dart';
import 'package:flutter/material.dart';

/// Defines a custom bottom navigation bar.
class NavBar extends StatelessWidget {
  /// A list of tabs to display.
  final List<INavItem> items;

  /// The tab to display.
  final int currentIndex;

  /// Returns the index of the tab that was tapped.
  final Function(int)? onTap;

  /// The color of the icon and text when the item is selected.
  final Color? selectedItemColor;

  /// The color of the icon and text when the item is not selected.
  final Color? unselectedItemColor;

  const NavBar({
    Key? key,
    required this.items,
    this.currentIndex = 1,
    this.onTap,
    this.selectedItemColor = AstraColors.white,
    this.unselectedItemColor = AstraColors.white03,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: Gradients.goldenGradient,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (final item in items)
            TweenAnimationBuilder<double>(
              tween: Tween(
                end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
              ),
              curve: Curves.easeOutQuint,
              duration: const Duration(milliseconds: 500),
              builder: (context, t, _) {
                return InkWell(
                  onTap: () => onTap?.call(items.indexOf(item)),
                  child: Row(
                    children: [
                      if (item is IconNavItem)
                        Icon(
                          (item as IconNavItem<IconData>).item,
                          color: items.indexOf(item) == currentIndex
                              ? item.unselectedColor
                              : item.selectedColor,
                          size: 26,
                        ),
                      if (item is SvgNavItem)
                        SvgIcon(
                          asset: (item as SvgNavItem<String>).item,
                          height: 22,
                          color: items.indexOf(item) == currentIndex
                              ? item.unselectedColor
                              : item.selectedColor,
                        )
                    ],
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}
