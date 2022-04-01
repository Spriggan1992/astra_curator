import 'package:astra_curator/clients/detailed_client_info/application/editing_detailed_client_info_actor/editing_detailed_client_info_actor_bloc.dart';
import 'package:astra_curator/clients/detailed_client_info/application/editing_detailed_client_info_actor/updated_client_loading_state.dart';
import 'package:astra_curator/clients/detailed_client_info/presentation/constants/editing_detailed_client_info_texts.dart';
import 'package:astra_curator/core/domain/models/client_detailed_info_model.dart';
import 'package:astra_curator/core/presentation/widgets/bars/appbar/main_app_bar.dart';
import 'package:astra_curator/core/presentation/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_curator/core/presentation/widgets/text_fields/reusable_text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Represent editing detailed client info screen content.
class EditingDetailedClientInfoContent extends StatelessWidget {
  /// Detailed info about client to display.
  final ClientDetailedInfoModel detailedInfo;

  /// State of updating client information.
  final ClientUpdatedLoadingState updatedClientLoadingState;

  const EditingDetailedClientInfoContent({
    Key? key,
    required this.detailedInfo,
    required this.updatedClientLoadingState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: ReusableAppBar(
          title: EditingDetailedClientInfoTexts.appBarTitle,
          onPressed: () => context.popRoute(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              children: [
                //Character.
                ReusableTextField(
                  initialTextValue: detailedInfo.character,
                  hint: EditingDetailedClientInfoTexts.character,
                  onChanged: (value) {
                    context.read<EditingDetailedClientInfoActorBloc>().add(
                          EditingDetailedClientInfoActorEvent.characterChanged(
                            value,
                          ),
                        );
                  },
                ),
                const SizedBox(height: 32),
                // Skills.
                ReusableTextField(
                  initialTextValue: detailedInfo.skills,
                  hint: EditingDetailedClientInfoTexts.skills,
                  onChanged: (value) {
                    context.read<EditingDetailedClientInfoActorBloc>().add(
                          EditingDetailedClientInfoActorEvent.skillsChanged(
                            value,
                          ),
                        );
                  },
                ),
                const SizedBox(height: 32),
                // Orientation.
                ReusableTextField(
                  initialTextValue: detailedInfo.orientation,
                  hint: EditingDetailedClientInfoTexts.orientation,
                  onChanged: (value) {
                    context.read<EditingDetailedClientInfoActorBloc>().add(
                          EditingDetailedClientInfoActorEvent
                              .orientationChanged(
                            value,
                          ),
                        );
                  },
                ),
                const SizedBox(height: 32),
                // Emotionality.
                ReusableTextField(
                  initialTextValue: detailedInfo.emotionality,
                  hint: EditingDetailedClientInfoTexts.emotionality,
                  onChanged: (value) {
                    context.read<EditingDetailedClientInfoActorBloc>().add(
                          EditingDetailedClientInfoActorEvent
                              .emotionalityChanged(
                            value,
                          ),
                        );
                  },
                ),
                const SizedBox(height: 32),
                // Intellectuality.
                ReusableTextField(
                  initialTextValue: detailedInfo.intellectuality,
                  hint: EditingDetailedClientInfoTexts.intellectuality,
                  onChanged: (value) {
                    context.read<EditingDetailedClientInfoActorBloc>().add(
                          EditingDetailedClientInfoActorEvent
                              .intellectualityChanged(
                            value,
                          ),
                        );
                  },
                ),
                const SizedBox(height: 32),
                // Sociability.
                ReusableTextField(
                  initialTextValue: detailedInfo.sociability,
                  hint: EditingDetailedClientInfoTexts.sociability,
                  onChanged: (value) {
                    context.read<EditingDetailedClientInfoActorBloc>().add(
                          EditingDetailedClientInfoActorEvent
                              .sociabilityChanged(
                            value,
                          ),
                        );
                  },
                ),
                const SizedBox(height: 32),
                // SelfRating.
                ReusableTextField(
                  initialTextValue: detailedInfo.selfRating,
                  hint: EditingDetailedClientInfoTexts.selfRating,
                  onChanged: (value) {
                    context.read<EditingDetailedClientInfoActorBloc>().add(
                          EditingDetailedClientInfoActorEvent.selfRatingChanged(
                            value,
                          ),
                        );
                  },
                ),
                const SizedBox(height: 32),
                // Volitionally.
                ReusableTextField(
                  initialTextValue: detailedInfo.volitionally,
                  hint: EditingDetailedClientInfoTexts.volitionally,
                  onChanged: (value) {
                    context.read<EditingDetailedClientInfoActorBloc>().add(
                          EditingDetailedClientInfoActorEvent
                              .volitionallyChanged(
                            value,
                          ),
                        );
                  },
                ),
                const SizedBox(height: 32),
                // SelfControl.
                ReusableTextField(
                  initialTextValue: detailedInfo.selfControl,
                  hint: EditingDetailedClientInfoTexts.selfControl,
                  onChanged: (value) {
                    context.read<EditingDetailedClientInfoActorBloc>().add(
                          EditingDetailedClientInfoActorEvent
                              .selfControlChanged(
                            value,
                          ),
                        );
                  },
                ),
                const SizedBox(height: 32),
                AstraGradientButton(
                  // isEnableButton: updatedClientLoadingState == UpdatedClientLoadingState.loading,
                  isLoading: updatedClientLoadingState ==
                      ClientUpdatedLoadingState.loading,
                  onClick: () {
                    context.read<EditingDetailedClientInfoActorBloc>().add(
                          const EditingDetailedClientInfoActorEvent
                              .buttonPressed(),
                        );
                  },
                  title: EditingDetailedClientInfoTexts.buttonTitle,
                ),
                const SizedBox(height: 42),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
