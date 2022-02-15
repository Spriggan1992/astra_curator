import 'package:astra_curator/presentation/core/buttons/astra_elevated_button.dart';
import 'package:astra_curator/presentation/core/routes/app_router.gr.dart';
import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/theming/gradients.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../core/widgets/icons/svg_icon.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
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
              AstraElevatedButton(
                onClick: () {
                  context.router.push(const PhoneNumberScreenRoute());
                },
                title: 'Войти',
                titleColor: AstraColors.btnBlueColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
