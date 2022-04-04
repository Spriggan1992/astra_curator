// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:astra_curator/auth/core/infrastructure/dio_interceptor.dart';
import 'package:astra_curator/clients/clients/application/clients_bloc.dart';
import 'package:astra_curator/core/infrastructure/database/sembast/sembast_database.dart';
import 'package:astra_curator/core/presentation/astra_curator_app.dart';
import 'package:astra_curator/core/presentation/routes/app_router.gr.dart';
import 'package:astra_curator/injection.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:injectable/injectable.dart';

class MockClientsBloc extends MockBloc<ClientsEvent, ClientsState>
    implements ClientsBloc {}

void main() {
  // Widget _testApp({required Widget child}) {
  //   return MaterialApp(
  //     home: child,
  //   );
  // }

  // Future<void> _appInitializer() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   configureInjection(Environment.prod);
  //   await getIt<SembastDatabase>().init();
  //   getIt<Dio>()
  //     ..options = BaseOptions(
  //       connectTimeout: 10000,
  //       receiveTimeout: 10000,
  //     )
  //     ..interceptors.add(getIt<DioInterceptor>());
  //   getIt.registerSingleton<AppRouter>(AppRouter());

  //   BlocOverrides.runZoned(
  //     () => runApp(const AstraCuratorApp()),
  //   );
  // }

  // testWidgets('Find text [Клиенты]', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //  await  _appInitializer();  
  //   final page = MultiBlocProvider(
  //     providers: [
  //       BlocProvider<ClientsBloc>(
  //         lazy: false,
  //         create: (context) => MockClientsBloc(),
  //       ),
  //       // BlocProvider<AuthenticationCubit>(
  //       //   lazy: false,
  //       //   create: (context) => MockAuthenticationCubit(),
  //       // ),
  //     ],
  //     child: MaterialApp(
  //       home: AstraCuratorApp(),
  //     ),
  //   );

  //   await tester.pumpWidget(page);

  //   expect(find.byWidget(page), findsOneWidget);
  //   expect(find.text('Клиенты'), findsOneWidget);
  // });
}
