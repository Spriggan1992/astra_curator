import 'package:astra_curator/presentation/core/routes/app_router.gr.dart';
import 'package:astra_curator/presentation/core/theming/gradients.dart';
import 'package:astra_curator/presentation/core/widgets/global/platform.activity_indicator.dart';
import 'package:astra_curator/presentation/core/widgets/icons/svg_icon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


/// Defines app splash screen.
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key, this.isLoading = false}) : super(key: key);

  /// Flag responsible for showing download indicator.
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          AutoRouter.of(context).push(const SigninScreenRoute());
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
                child:
                    const PlatformActivityIndicator(isCapertinoDarkTheme: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
