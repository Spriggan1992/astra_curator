import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
import 'package:astra_curator/core/presentation/dialogs/snack_bar.dart';
import 'package:astra_curator/core/presentation/routes/app_router.gr.dart';
import 'package:astra_curator/core/presentation/widgets/bars/appbar/main_app_bar.dart';
import 'package:astra_curator/core/presentation/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_curator/core/presentation/widgets/text_fields/reusable_text_field.dart';
import 'package:astra_curator/injection.dart';
import 'package:astra_curator/new_client/detailed_info/application/adding_detailed_info_bloc.dart';
import 'package:astra_curator/new_client/detailed_info/presentation/constants/constants.dart';
import 'package:astra_curator/new_client/detailed_info/presentation/widgets/client_adding_completion_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent adding detailed information about client screen.
class NewClientDetailedInfoScreen extends StatelessWidget {
  const NewClientDetailedInfoScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddingDetailedInfoBloc>(),
      child: BlocConsumer<AddingDetailedInfoBloc, AddingDetailedInfoState>(
        buildWhen: (p, c) =>
            p.anyFieldIsNotEmpty != c.anyFieldIsNotEmpty ||
            p.loadingState != c.loadingState,
        listener: (context, state) {
          if (state.loadingState == LoadingStatesWithFailure.success) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (dialogContext) {
                return ClientAddingCompletionDialog(
                  onClose: () {
                    dialogContext.popRoute();
                    context.navigateTo(
                      const HomeScreenRoute(
                        children: [
                          ClientsTab(),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          }
          if (state.loadingState ==
              LoadingStatesWithFailure.noConnectionFailure) {
            showSnackBar(
              context,
            );
          }
          if (state.loadingState ==
              LoadingStatesWithFailure.unexpectedFailure) {
            showSnackBar(
              context,
              title: NewClientDetailedInfoTexts.unexpectedFailureTitle,
            );
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: ReusableAppBar(
                title: NewClientDetailedInfoTexts.appBarTitle,
                onPressed: () => context.popRoute(),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    children: [
                      ReusableTextField(
                        hint: NewClientDetailedInfoTexts.character,
                        onChanged: (value) {
                          context.read<AddingDetailedInfoBloc>().add(
                                AddingDetailedInfoEvent.characterChanged(value),
                              );
                        },
                      ),
                      const SizedBox(height: 32),
                      ReusableTextField(
                        hint: NewClientDetailedInfoTexts.skills,
                        onChanged: (value) {
                          context.read<AddingDetailedInfoBloc>().add(
                                AddingDetailedInfoEvent.skillsChanged(value),
                              );
                        },
                      ),
                      const SizedBox(height: 32),
                      ReusableTextField(
                        hint: NewClientDetailedInfoTexts.orientation,
                        onChanged: (value) {
                          context.read<AddingDetailedInfoBloc>().add(
                                AddingDetailedInfoEvent.orientationChanged(
                                  value,
                                ),
                              );
                        },
                      ),
                      const SizedBox(height: 32),
                      ReusableTextField(
                        hint: NewClientDetailedInfoTexts.emotionality,
                        onChanged: (value) {
                          context.read<AddingDetailedInfoBloc>().add(
                                AddingDetailedInfoEvent.emotionalityChanged(
                                  value,
                                ),
                              );
                        },
                      ),
                      const SizedBox(height: 32),
                      ReusableTextField(
                        hint: NewClientDetailedInfoTexts.intellectuality,
                        onChanged: (value) {
                          context.read<AddingDetailedInfoBloc>().add(
                                AddingDetailedInfoEvent.intellectualityChanged(
                                  value,
                                ),
                              );
                        },
                      ),
                      const SizedBox(height: 32),
                      ReusableTextField(
                        hint: NewClientDetailedInfoTexts.sociability,
                        onChanged: (value) {
                          context.read<AddingDetailedInfoBloc>().add(
                                AddingDetailedInfoEvent.sociabilityChanged(
                                  value,
                                ),
                              );
                        },
                      ),
                      const SizedBox(height: 32),
                      ReusableTextField(
                        hint: NewClientDetailedInfoTexts.selfRating,
                        onChanged: (value) {
                          context.read<AddingDetailedInfoBloc>().add(
                                AddingDetailedInfoEvent.selfRatingChanged(
                                  value,
                                ),
                              );
                        },
                      ),
                      const SizedBox(height: 32),
                      ReusableTextField(
                        hint: NewClientDetailedInfoTexts.volitionally,
                        onChanged: (value) {
                          context.read<AddingDetailedInfoBloc>().add(
                                AddingDetailedInfoEvent.volitionallyChanged(
                                  value,
                                ),
                              );
                        },
                      ),
                      const SizedBox(height: 32),
                      ReusableTextField(
                        hint: NewClientDetailedInfoTexts.selfControl,
                        onChanged: (value) {
                          context.read<AddingDetailedInfoBloc>().add(
                                AddingDetailedInfoEvent.selfControlChanged(
                                  value,
                                ),
                              );
                        },
                      ),
                      const SizedBox(height: 32),
                      AstraGradientButton(
                        isEnableButton: state.anyFieldIsNotEmpty,
                        isLoading: state.loadingState ==
                            LoadingStatesWithFailure.loading,
                        onClick: () {
                          context.read<AddingDetailedInfoBloc>().add(
                                const AddingDetailedInfoEvent.buttonPressed(),
                              );
                        },
                        title: NewClientDetailedInfoTexts.buttonTitle,
                      ),
                      const SizedBox(height: 42),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
