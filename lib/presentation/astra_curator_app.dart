import 'dart:developer';

import 'package:astra_curator/application/auth/auth/auth_bloc.dart';
import 'package:astra_curator/injection.dart';
import 'package:astra_curator/presentation/core/routes/app_router.gr.dart';
import 'package:astra_curator/presentation/core/theming/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Represent main app.
class AstraCuratorApp extends StatelessWidget {
  const AstraCuratorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (__) => context.read<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            ),
        ),
      
      ],
      child: MaterialApp.router(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru', ''),
        ],
        theme: AppTheme.lightTheme,
        routerDelegate: getIt<AppRouter>().delegate(),
        
        routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log('created $bloc');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log(event.toString());
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log(transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log(error.toString());
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    log('closed $bloc');
    super.onClose(bloc);
  }
}
