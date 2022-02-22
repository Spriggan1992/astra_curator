import 'package:astra_curator/presentation/astra_curator/account/account_screen.dart';
import 'package:astra_curator/presentation/astra_curator/adding_client/adding_client_screen.dart';
import 'package:astra_curator/presentation/astra_curator/chats/chats_screen.dart';
import 'package:astra_curator/presentation/astra_curator/clients/client_screen.dart';
import 'package:astra_curator/presentation/astra_curator/home_screen.dart';
import 'package:astra_curator/presentation/auth/phone_number_screen.dart';
import 'package:astra_curator/presentation/auth/signin_screen.dart';
import 'package:astra_curator/presentation/auth/splash_screen.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true, path: '/'),
    MaterialRoute(page: SigninScreen, initial: false, path: 'signin'),
    MaterialRoute(
      page: PhoneNumberScreen,
      initial: false,
      path: 'phoneNumberScreen',
    ),
    AutoRoute(
      path: '',
      page: HomeScreen,
      children: [
        AutoRoute(
          path: '',
          name: 'AddingClientRouter',
          page: AddingClientScreen,
          children: [
            AutoRoute(path: ':addingClientScreen', page: AddingClientScreen),
          ],
        ),
        AutoRoute(
          path: '',
          name: 'ClientsRouter',
          page: ClientsScreen,
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
