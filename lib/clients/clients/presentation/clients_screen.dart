import 'package:astra_curator/clients/clients/application/clients_bloc.dart';
import 'package:astra_curator/clients/clients/application/clients_sort_types.dart';
import 'package:astra_curator/clients/clients/presentation/constants/clients_texts.dart';
import 'package:astra_curator/clients/clients/presentation/widgets/client_tile.dart';
import 'package:astra_curator/clients/clients/presentation/widgets/sort_popup_menu.dart';
import 'package:astra_curator/core/application/enums/astra_failures.dart';
import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
import 'package:astra_curator/core/presentation/routes/app_router.gr.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/bars/appbar/main_app_bar.dart';
import 'package:astra_curator/core/presentation/widgets/global/platform.activity_indicator.dart';
import 'package:astra_curator/core/presentation/widgets/pagination/pagination_list.dart';
import 'package:astra_curator/core/presentation/widgets/scaffolds/error_screens/astra_failure_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent client screen.
class ClientsScreen extends StatelessWidget {
  const ClientsScreen({Key? key}) : super(key: key);

  /// Send event to sort.
  void onPressedPopupItem(BuildContext context, int value) {
    switch (value) {
      case 1:
        context
            .read<ClientsBloc>()
            .add(const ClientsEvent.sortClients(SortTypes.sortByDate));
        break;
      case 2:
        context
            .read<ClientsBloc>()
            .add(const ClientsEvent.sortClients(SortTypes.sortById));
        break;
      case 3:
        context
            .read<ClientsBloc>()
            .add(const ClientsEvent.sortClients(SortTypes.sortByNameAscending));
        break;
      case 4:
        context.read<ClientsBloc>().add(
              const ClientsEvent.sortClients(SortTypes.sortByNameDescending),
            );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        title: AppTexts.clients,
        actions: [
          SortPopUpMenu(
            onSelected: (value) {
              onPressedPopupItem(context, value);
            },
          ),
        ],
      ),
      body: BlocBuilder<ClientsBloc, ClientsState>(
        builder: (context, state) {
          if (state.loadingStates == LoadingStatesWithFailure.initial) {
            return const Center(child: PlatformActivityIndicator());
          } else if (state.loadingStates == LoadingStatesWithFailure.loading) {
            return const Center(child: PlatformActivityIndicator());
          } else if (state.loadingStates == LoadingStatesWithFailure.success) {
            if (state.paginationModel.items!.isNotEmpty) {
              return PaginationList<ClientModel>(
                onRefreshItems: () async {
                  context.read<ClientsBloc>().add(
                        const ClientsEvent.loadClients(isRefreshItems: true),
                      );
                },
                items: state.paginationModel.items!,
                buildContent: (client) => ClientTile(
                  dateTime: client.lastDate,
                  id: client.id,
                  name: client.fullName,
                  imageUrl: client.mainImagePath,
                  onTileTap: () {
                    context.navigateTo(EditingClientRouter(client: client));
                  },
                ),
                onNextItemsLoaded: () {
                  context.read<ClientsBloc>().add(
                        const ClientsEvent.loadClients(isRefreshItems: false),
                      );
                },
                isAvailableToLoad: state.isAvailableToLoad,
              );
            } else {
              return const Center(child: Text(AppTexts.emptyList));
            }
          } else {
            return ErrorScreen(
              failure: (state.loadingStates ==
                      LoadingStatesWithFailure.noConnectionFailure)
                  ? AstraFailures.noConnection
                  : AstraFailures.unexpected,
              onTryAgain: () {},
            );
          }
        },
      ),
    );
  }
}
