import 'package:astra_curator/core/presentation/routes/app_router.gr.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/theming/gradients.dart';
import 'package:astra_curator/core/presentation/widgets/buttons/astra_elevated_button.dart';
import 'package:astra_curator/core/presentation/widgets/icons/svg_icon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Signing entry screen.
class SingingScreen extends StatelessWidget {
  const SingingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 56),
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
              SizedBox(height: MediaQuery.of(context).size.height / 4),
              AstraElevatedButton(
                onClick: () {
                  context.router.push(const PhoneNumberScreenRoute());
                },
                title: 'Войти',
                titleColor: AstraColors.mainDarkGold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
