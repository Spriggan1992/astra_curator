import 'package:astra_curator/injection.dart';
import 'package:astra_curator/presentation/core/routes/app_router.gr.dart';
import 'package:astra_curator/presentation/core/theming/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Represent main app.
class AstraCuratorApp extends StatelessWidget {
  const AstraCuratorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      routerDelegate: getIt<AppRouter>().delegate(),
      routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
