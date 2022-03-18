import 'package:astra_curator/presentation/astra_curator/account/account_screen.dart';
import 'package:astra_curator/presentation/astra_curator/chats/chats_screen.dart';
import 'package:astra_curator/presentation/astra_curator/clients/client_screen.dart';
import 'package:astra_curator/presentation/astra_curator/home_screen.dart';
import 'package:astra_curator/presentation/astra_curator/new_client/adding_client/adding_client_screen.dart';
import 'package:astra_curator/presentation/astra_curator/new_client/additional_screen/new_client_additional_screen.dart';
import 'package:astra_curator/presentation/astra_curator/new_client/detailed_info_screen/new_client_detailed_info_screen.dart';
import 'package:astra_curator/presentation/auth/password_screen.dart';
import 'package:astra_curator/presentation/auth/phone_number_screen.dart';
import 'package:astra_curator/presentation/auth/signin_screen.dart';
import 'package:astra_curator/presentation/auth/splash_screen.dart';
import 'package:astra_curator/presentation/core/widgets/screens/photos_screen.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: SplashScreen, initial: true, path: '/'),
    AutoRoute(page: SigninScreen),
    AutoRoute(page: PasswordScreen),
    AutoRoute(
      page: PhoneNumberScreen,
      path: 'phoneNumberScreen',
    ),
    AutoRoute(
      page: HomeScreen,
      children: [
        _newClient,
        _clients,
        _chats,
        _account,
      ],
    )
  ],
)
class $AppRouter {}

const _newClient = AutoRoute(
  initial: true,
  name: 'NewClientTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      path: '',
      name: 'NewClientAddingClientRouter',
      page: NewClientAddingClientScreen,
    ),
    AutoRoute(
      name: 'NewClientAdditionalRouter',
      path: ':newClientAdditionalScreen',
      page: NewClientAdditionalScreen,
    ),
    AutoRoute(
      name: 'NewClientPhotosRouter',
      path: ':newClientPhotosScreen',
      page: PhotosScreen,
      meta: {'hideBottomNav': true},
    ),
    AutoRoute(
      name: 'NewClientDetailedInfoRouter',
      path: ':newClientDetailedInfoScreen',
      page: NewClientDetailedInfoScreen,
    ),
  ],
);

const _clients = AutoRoute(
  name: 'ClientsTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      path: '',
      name: 'ClientsRouter',
      page: ClientsScreen,
    ),
    AutoRoute(
      name: 'EditingClientRouter',
      path: ':editingClientScreen',
      page: NewClientAddingClientScreen,
    ),
  ],
);

const _chats = AutoRoute(
  name: 'ChatsTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(path: '', page: ChatsScreen),
  ],
);

const _account = AutoRoute(
  name: 'AccountTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(path: '', page: AccountScreen),
  ],
);
