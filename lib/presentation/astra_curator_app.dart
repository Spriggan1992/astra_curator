import 'package:astra_curator/application/account/account_history/account_history_bloc.dart';
import 'package:astra_curator/application/account/withdraw/withdraw_bloc.dart';
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
          create: (context) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            ),
        ),
        BlocProvider<AccountHistoryBloc>(
          create: (context) => getIt<AccountHistoryBloc>(),
        ),
        BlocProvider<WithdrawBloc>(create: (context) => getIt<WithdrawBloc>()),
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
