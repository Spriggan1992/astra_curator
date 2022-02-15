import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/widgets/bars/bottom_navigation_bar/i_nav_item.dart';
import 'package:flutter/material.dart';

/// Represent element of navigation bar as icon.
class IconNavItem<T> implements INavItem {
  /// Tab element as [IconData]
  @override
  final T item;

  /// Icon selected color.
  Color selectedColor;

  /// Icon unselected coplor.
  Color unselectedColor;

  IconNavItem({
    required this.item,
    this.selectedColor = AstraColors.white03,
    this.unselectedColor = AstraColors.white,
  });
}
