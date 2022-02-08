import 'package:astra_curator/presentation/astra_curator/home_screen.dart';
import 'package:astra_curator/presentation/auth/splash_screen.dart';
import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true, path: '/'),
    AutoRoute(
      path: '',
      page: HomeScreen,
      children: [],
    )
  ],
)
class $AppRouter {}
