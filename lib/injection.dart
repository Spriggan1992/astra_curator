import 'package:astra_curator/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// Get instance of [GetIt]
final GetIt getIt = GetIt.instance;

/// initializes the configurations of [GetIt].
///
/// `env` environment
@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
