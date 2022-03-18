import 'package:astra_curator/presentation/astra_curator/new_client/additional_screen/constants.dart';
import 'package:astra_curator/presentation/core/routes/app_router.gr.dart';
import 'package:astra_curator/presentation/core/widgets/bars/appbar/main_app_bar.dart';
import 'package:astra_curator/presentation/core/widgets/buttons/astra_gradient_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Represent additional screen for new client module.
class NewClientAdditionalScreen extends StatelessWidget {
  const NewClientAdditionalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: const ReusableAppBar(
          title: Constants.appBarTitle,
        ),
        body: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Constants.noticeTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        Constants.noticeContent,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 46),
                        child: AstraGradientButton(
                          onClick: () {
                            context.navigateTo(
                              const NewClientDetailedInfoRouter(),
                            );
                          },
                          title: Constants.buttonTitle,
                        ),
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {
                          context.navigateTo(
                            const HomeScreenRoute(
                              children: [ClientsTab()],
                            ),
                          );
                        },
                        child: Text(
                          Constants.fillLater,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(decoration: TextDecoration.underline),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
