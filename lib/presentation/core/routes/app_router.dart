import 'package:astra_curator/presentation/astra_curator/account/account_screen.dart';
import 'package:astra_curator/presentation/astra_curator/adding_client/adding_client_screen.dart';
import 'package:astra_curator/presentation/astra_curator/chats/chats_screen.dart';
import 'package:astra_curator/presentation/astra_curator/clients/client_screen.dart';
import 'package:astra_curator/presentation/astra_curator/home_screen.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  routes: [
    // MaterialRoute(page: SplashScreen, initial: true, path: '/'),
    AutoRoute(
      path: '',
      page: HomeScreen,
      children: [
        AutoRoute(
          path: '',
          name: 'AddingClientRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: ':addingClientScreen', page: AddingClientScreen),
          ],
        ),
        AutoRoute(
          path: '',
          name: 'ClientsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: ':clientsScreen', page: ClientsScreen),
          ],
        ),
        AutoRoute(
          path: '',
          name: 'ChatsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: ':chatsScreen', page: ChatsScreen),
          ],
        ),
        AutoRoute(
          path: '',
          name: 'AccountRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: ':accountScreen', page: AccountScreen),
          ],
        ),
      ],
    )
  ],
)
class $AppRouter {}
