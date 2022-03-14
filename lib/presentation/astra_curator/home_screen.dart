// ignore_for_file: avoid_dynamic_calls

import 'package:astra_curator/application/account/account_history/account_history_bloc.dart';
import 'package:astra_curator/presentation/core/routes/app_router.gr.dart';
import 'package:astra_curator/presentation/core/widgets/bars/bottom_navigation_bar/icon_nav_item.dart';
import 'package:astra_curator/presentation/core/widgets/bars/bottom_navigation_bar/nav_bar.dart';
import 'package:astra_curator/presentation/core/widgets/bars/bottom_navigation_bar/svg_nav_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _routes = [
  AddingClientRouter(),
  ClientsRouter(),
  ChatsRouter(),
  AccountRouter(),
];

/// Represent start screen for app when user already authorized in app.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      routes: _routes,
      bottomNavigationBuilder: (navContext, tabsRouter) {
        return NavBar(
          onTap: (index) {
            tabsRouter.setActiveIndex(index);
            //_loadDataWhenPressNavButton(navContext, index, _routes);
          },
          currentIndex: tabsRouter.activeIndex,
          items: [
            SvgNavItem(
              item: 'assets/icons/ic_preson_add_filled.svg',
            ),
            IconNavItem(
              item: CupertinoIcons.person_2_fill,
            ),
            IconNavItem(
              item: CupertinoIcons.envelope,
            ),
            SvgNavItem(
              item: 'assets/icons/ic_bank_card.svg',
            ),
          ],
        );
      },
    );
  }

}
