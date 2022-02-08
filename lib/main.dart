import 'package:astra_curator/injection.dart';
import 'package:astra_curator/presentation/astra_curator_app.dart';
import 'package:astra_curator/presentation/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() async {
  await _appInitializer();
}

/// Initializes dependencies.
Future<void> _appInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  // configureInjection(Environment.prod);
  // await getIt<SembastDatabase>().init();
  // getIt<Dio>()
  //   ..options = BaseOptions(
  //     connectTimeout: 5000,
  //     receiveTimeout: 3000,
  //   )
  // ..interceptors.add(getIt<DioInterceptor>());
  getIt.registerSingleton<AppRouter>(AppRouter());
  return runApp(const AstraCuratorApp());
}
