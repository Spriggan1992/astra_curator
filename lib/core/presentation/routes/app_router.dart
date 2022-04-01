import 'package:astra_curator/account/presentation/account_screen.dart';
import 'package:astra_curator/auth/core/presentation/splash_screen.dart';
import 'package:astra_curator/auth/password/presentation/password_screen.dart';
import 'package:astra_curator/auth/phone/presentation/phone_number_screen.dart';
import 'package:astra_curator/auth/signing/presentation/signin_screen.dart';
import 'package:astra_curator/chats/chat/presentation/chat_screen.dart';
import 'package:astra_curator/chats/chats/presentation/chats_screen.dart';
import 'package:astra_curator/clients/clients/presentation/clients_screen.dart';
import 'package:astra_curator/clients/detailed_client_info/presentation/editing_detailed_client_info_screen.dart';
import 'package:astra_curator/clients/edditing_client/presentation/editing_client_screen.dart';
import 'package:astra_curator/core/presentation/home_screen.dart';
import 'package:astra_curator/new_client/adding_client/presentation/adding_client_screen.dart';
import 'package:astra_curator/new_client/additional_screen/presentation/new_client_additional_screen.dart';
import 'package:astra_curator/new_client/detailed_info/presentation/new_client_detailed_info_screen.dart';
import 'package:astra_curator/photos/presentation/photos_screen.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: SplashScreen, initial: true, path: '/'),
    AutoRoute(page: SingingScreen),
    AutoRoute(page: PasswordScreen),
    AutoRoute(page: ChatScreen),
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
      page: EditingClientScreen,
    ),
    AutoRoute(
      name: 'ClientsPhotosRouter',
      path: ':clientsPhotosScreen',
      page: PhotosScreen,
      meta: {'hideBottomNav': true},
    ),
    AutoRoute(
      name: 'EditingDetailedClientInfoRouter',
      path: ':editingDetailedClientInfoScreen',
      page: EditingDetailedClientInfoScreen,
      // meta: {'hideBottomNav': true},
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
