import 'dart:developer';

import 'package:astra_curator/injection.dart';
import 'package:astra_curator/presentation/core/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

/// Represent observer routes.
class RouterObserver extends AutoRouterObserver {
  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    if (previousRoute.name == 'ClientsTab') {
      final router = getIt<AppRouter>();
      if (router.root.topMatch.name == 'NewClientAdditionalRouter' ||
          router.root.topMatch.name == 'NewClientDetailedInfoRouter') {
        router.pushAndPopUntil(const HomeScreenRoute(), predicate: (_) => true);
      }
    }
  }
}
