import 'package:astra_curator/application/account/account_history/account_history_bloc.dart';
import 'package:astra_curator/application/clients/clients_bloc.dart';
import 'package:astra_curator/application/cubit/app_bar_cubit.dart';
import 'package:astra_curator/application/photos/photos_bloc.dart';
import 'package:astra_curator/injection.dart';
import 'package:astra_curator/presentation/core/routes/app_router.gr.dart';
import 'package:astra_curator/presentation/core/routes/router_observer.dart';
import 'package:astra_curator/presentation/core/widgets/bars/bottom_navigation_bar/icon_nav_item.dart';
import 'package:astra_curator/presentation/core/widgets/bars/bottom_navigation_bar/nav_bar.dart';
import 'package:astra_curator/presentation/core/widgets/bars/bottom_navigation_bar/svg_nav_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _routes = [
  NewClientTab(),
  ClientsTab(),
  ChatsTab(),
  AccountTab(),
];

/// Represent start screen for app when user already authorized in app.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<AppBarCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<PhotosBloc>(),
          ),
        ],
        child: AutoTabsScaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          routes: _routes,
          navigatorObservers: () => [RouterObserver()],
          bottomNavigationBuilder: (navContext, tabsRouter) {
            return _buildBottomBar(context, tabsRouter);
          },
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, TabsRouter tabsRouter) {
    final hideBottomNav = tabsRouter.topMatch.meta['hideBottomNav'] == true;
    return hideBottomNav
        ? const SizedBox.shrink()
        : NavBar(
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
              _loadDataWhenPressNavButton(context, index, _routes);
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
  }

  void _loadDataWhenPressNavButton(
    BuildContext context,
    int index,
    List<PageRouteInfo<dynamic>> routes,
  ) {
    switch (index) {
      case 0:
        break;
      case 1:
        context.read<ClientsBloc>().add(const ClientsEvent.loadClients());
        break;
      case 2:
        break;
      case 3:
        context
            .read<AccountHistoryBloc>()
            .add(const AccountHistoryEvent.loadHistories());
        break;
    }
  }
}
