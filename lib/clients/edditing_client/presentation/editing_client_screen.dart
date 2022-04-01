import 'package:astra_curator/clients/clients/domain/models/client.dart';
import 'package:astra_curator/clients/edditing_client/application/editing_client_actor/editing_client_actor_bloc.dart';
import 'package:astra_curator/clients/edditing_client/application/editing_client_bloc.dart';
import 'package:astra_curator/clients/edditing_client/presentation/widgets/editing_client_content.dart';
import 'package:astra_curator/core/application/enums/astra_failures.dart';
import 'package:astra_curator/core/application/enums/loading_states.dart';
import 'package:astra_curator/core/domain/models/city_model.dart';
import 'package:astra_curator/core/domain/models/country_model.dart';
import 'package:astra_curator/core/domain/models/new_client_model.dart';
import 'package:astra_curator/core/presentation/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:astra_curator/core/presentation/widgets/scaffolds/loading_screen.dart';
import 'package:astra_curator/injection.dart';
import 'package:astra_curator/photos/application/photos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent editing client screen.
class EditingClientScreen extends StatelessWidget {
  /// Client.
  final ClientModel client;

  const EditingClientScreen({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditingClientBloc>()
        ..add(
          EditingClientEvent.initialized(client),
        ),
      child: BlocBuilder<EditingClientBloc, EditingClientState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const SizedBox.shrink(),
            loading: (_) => const LoadingScreen(),
            success: (state) => _buildScreenContent(
              state.client,
              state.cities,
              state.countries,
            ),
            failure: (state) => state.failure.map(
              api: (_) => ErrorScreen(
                failure: AstraFailures.unexpected,
                onTryAgain: () => context
                    .read<EditingClientBloc>()
                    .add(EditingClientEvent.initialized(client)),
              ),
              noConnection: (_) => ErrorScreen(
                failure: AstraFailures.unexpected,
                onTryAgain: () => context
                    .read<EditingClientBloc>()
                    .add(EditingClientEvent.initialized(client)),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildScreenContent(
    NewClientModel clientModel,
    List<CityModel> cities,
    List<CountryModel> countries,
  ) {
    return BlocProvider(
      create: (context) => getIt<EditingClientActorBloc>()
        ..add(EditingClientActorEvent.initialized(clientModel)),
      child: BlocBuilder<EditingClientActorBloc, EditingClientActorState>(
        builder: (context, actorState) {
          if (actorState.loadingState == LoadingStates.success) {
            return MultiBlocListener(
              listeners: [
                BlocListener<PhotosBloc, PhotosState>(
                  listenWhen: (p, c) =>
                      p.isSuccessfullyChangedMainPhoto !=
                          c.isSuccessfullyChangedMainPhoto ||
                      p.isSuccessfullyDeletePhoto !=
                          c.isSuccessfullyDeletePhoto,
                  listener: (context, state) {
                    if (state.isSuccessfullyDeletePhoto) {
                      context.read<EditingClientActorBloc>().add(
                            EditingClientActorEvent.photosUpdated(
                              state.images,
                            ),
                          );
                    }
                    if (state.isSuccessfullyChangedMainPhoto) {
                      context.read<EditingClientActorBloc>().add(
                            EditingClientActorEvent.photosUpdated(
                              state.updatedPhotos,
                            ),
                          );
                    }
                  },
                ),
              ],
              child: EditingClientContent(
                canSubmit: actorState.canSubmit,
                client: actorState.client,
                cities: cities,
                countries: countries,
                formIsValid: actorState.formIsValid,
                userId: client.id,
              ),
            );
          } else if (actorState.loadingState == LoadingStates.loading ||
              actorState.loadingState == LoadingStates.initial) {
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
