import 'package:astra_curator/clients/detailed_client_info/application/editing_detailed_client_info/editing_detailed_client_info_bloc.dart';
import 'package:astra_curator/clients/detailed_client_info/application/editing_detailed_client_info_actor/editing_detailed_client_info_actor_bloc.dart';
import 'package:astra_curator/clients/detailed_client_info/application/editing_detailed_client_info_actor/updated_client_loading_state.dart';
import 'package:astra_curator/clients/detailed_client_info/presentation/constants/editing_detailed_client_info_texts.dart';
import 'package:astra_curator/clients/detailed_client_info/presentation/widgets/editing_detailed_clientInfo_content.dart';
import 'package:astra_curator/core/application/enums/astra_failures.dart';
import 'package:astra_curator/core/application/enums/loading_states.dart';
import 'package:astra_curator/core/domain/models/client_detailed_info_model.dart';
import 'package:astra_curator/core/presentation/dialogs/snack_bar.dart';
import 'package:astra_curator/core/presentation/widgets/buttons/dialog_action_button.dart';
import 'package:astra_curator/core/presentation/widgets/dialogs/dialog_one_actions.dart';
import 'package:astra_curator/core/presentation/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_curator/core/presentation/widgets/scaffolds/loading_screen.dart';
import 'package:astra_curator/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent editing detailed client info screen.
class EditingDetailedClientInfoScreen extends StatelessWidget {
  /// Client identifier.
  final int userId;
  const EditingDetailedClientInfoScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditingDetailedClientInfoBloc>()
        ..add(EditingDetailedClientInfoEvent.dataLoaded(userId)),
      child: BlocBuilder<EditingDetailedClientInfoBloc,
          EditingDetailedClientInfoState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const SizedBox.shrink(),
            loading: (_) => const LoadingScreen(),
            success: (state) => _buildScreenContent(state.detailedInfo),
            failure: (state) => state.failure.map(
              api: (_) => ErrorScreen(
                failure: AstraFailures.unexpected,
                onTryAgain: () {},
              ),
              noConnection: (_) => ErrorScreen(
                failure: AstraFailures.noConnection,
                onTryAgain: () {},
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildScreenContent(ClientDetailedInfoModel detailedInfo) {
    return BlocProvider(
      create: (context) => getIt<EditingDetailedClientInfoActorBloc>()
        ..add(
          EditingDetailedClientInfoActorEvent.initialized(
            detailedInfo,
            userId,
          ),
        ),
      child: BlocConsumer<EditingDetailedClientInfoActorBloc,
          EditingDetailedClientInfoActorState>(
        listener: (context, state) {
          if (state.clientUpdatedLoadingState ==
              ClientUpdatedLoadingState.success) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (contextDialog) {
                return DialogOneAction(
                  content: const Text(
                    EditingDetailedClientInfoTexts.profileSuccessfullyChanged,
                    textAlign: TextAlign.center,
                  ),
                  action: DialogActionButton(
                    title: 'ОК',
                    onClick: () {
                      context.popRoute();
                      contextDialog.popRoute();
                    },
                  ),
                );
              },
            );
          }
          if (state.clientUpdatedLoadingState ==
              ClientUpdatedLoadingState.noConnection) {
            showSnackBar(context);
          }
          if (state.clientUpdatedLoadingState ==
              ClientUpdatedLoadingState.unexpected) {
            showSnackBar(
              context,
              title: EditingDetailedClientInfoTexts.unexpectedFailureTitle,
            );
          }
        },
        builder: (context, state) {
          if (state.loadingState == LoadingStates.success) {
            return EditingDetailedClientInfoContent(
              detailedInfo: state.clientInfo,
              updatedClientLoadingState: state.clientUpdatedLoadingState,
            );
          } else if (state.loadingState == LoadingStates.initial ||
              state.loadingState == LoadingStates.loading) {
            return const LoadingScreen();
          } else {
            return ErrorScreen(
              failure: AstraFailures.unexpected,
              onTryAgain: () {},
            );
          }
        },
      ),
    );
  }
}
