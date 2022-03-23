import 'package:astra_curator/application/core/enums/loading_state_with_failures.dart';
import 'package:astra_curator/application/core/enums/loading_states.dart';
import 'package:astra_curator/application/new_client/adding_client/adding_client_bloc.dart';
import 'package:astra_curator/application/photos/photos_bloc.dart';
import 'package:astra_curator/injection.dart';
import 'package:astra_curator/presentation/astra_curator/new_client/adding_client/constants.dart';
import 'package:astra_curator/presentation/astra_curator/new_client/adding_client/widgets/adding_client_screen_content.dart';
import 'package:astra_curator/presentation/core/dialogs/snack_bar.dart';
import 'package:astra_curator/presentation/core/routes/app_router.gr.dart';
import 'package:astra_curator/presentation/core/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_curator/presentation/core/widgets/scaffolds/loading_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent screen of register new client.
class NewClientAddingClientScreen extends StatelessWidget {
  const NewClientAddingClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddingClientBloc>()
        ..add(
          const AddingClientEvent.initialized(),
        ),
      child: BlocConsumer<AddingClientBloc, AddingClientState>(
        listener: (context, state) {
          if (state.registerLoadingStates == LoadingStatesWithFailure.success) {
            context.navigateTo(const NewClientAdditionalRouter());
          }
          if (state.registerLoadingStates ==
              LoadingStatesWithFailure.unexpectedFailure) {
            showSnackBar(context, title: Constants.unexpectedFailureTitle);
          }
          if (state.registerLoadingStates ==
              LoadingStatesWithFailure.noConnectionFailure) {
            showSnackBar(context);
          }
        },
        builder: (context, state) {
          if (state.loadingState == LoadingStates.loading ||
              state.loadingState == LoadingStates.initial) {
            return const LoadingScreen();
          } else if (state.loadingState == LoadingStates.failure) {
            return ErrorScreen(
              failure: state.astraFailure,
              onTryAgain: () {
                context.read<AddingClientBloc>().add(
                      const AddingClientEvent.initialized(),
                    );
              },
            );
          } else {
            return BlocListener<PhotosBloc, PhotosState>(
              listenWhen: (p, c) =>
                  p.isSuccessfullyChangedMainPhoto !=
                      c.isSuccessfullyChangedMainPhoto ||
                  p.isSuccessfullyDeletePhoto != c.isSuccessfullyDeletePhoto,
              listener: (context, state) {
                if (state.isSuccessfullyDeletePhoto) {
                  context
                      .read<AddingClientBloc>()
                      .add(AddingClientEvent.photosUpdated(state.images));
                }
                if (state.isSuccessfullyChangedMainPhoto) {
                  context.read<AddingClientBloc>().add(
                        AddingClientEvent.photosUpdated(state.updatedPhotos),
                      );
                }
              },
              child: AddingClientScreenContent(
                cities: state.cities,
                countries: state.countries,
              ),
            );
          }
        },
      ),
    );
  }
}
