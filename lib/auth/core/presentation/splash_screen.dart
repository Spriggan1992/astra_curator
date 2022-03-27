import 'package:astra_curator/auth/core/application/auth_bloc.dart';
import 'package:astra_curator/core/presentation/routes/app_router.gr.dart';
import 'package:astra_curator/core/presentation/theming/gradients.dart';
import 'package:astra_curator/core/presentation/widgets/global/platform.activity_indicator.dart';
import 'package:astra_curator/core/presentation/widgets/icons/svg_icon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Defines app splash screen.
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key, this.isLoading = false}) : super(key: key);

  /// Flag responsible for showing download indicator.
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              initial: (_) {},
              authenticated: (_) {
                AutoRouter.of(context).push(const HomeScreenRoute());
              },
              unauthenticated: (_) {
                AutoRouter.of(context).push(const SingingScreenRoute());
              },
            );
          },
        ),
      ],
      child: Scaffold(
        body: InkWell(
          onTap: () {
            AutoRouter.of(context).push(const SingingScreenRoute());
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: Gradients.goldenGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SvgIcon(asset: 'assets/icons/logo.svg'),
                const SizedBox(height: 40),
                Visibility(
                  visible: isLoading,
                  child: const PlatformActivityIndicator(
                    isCupertinoDarkTheme: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
