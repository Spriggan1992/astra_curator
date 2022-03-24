import 'package:astra_curator/clients/application/clients_bloc.dart';
import 'package:astra_curator/clients/application/clients_sort_types.dart';
import 'package:astra_curator/clients/presentation/clients_screen/constants/clients_texts.dart';
import 'package:astra_curator/clients/presentation/clients_screen/widgets/client_tile.dart';
import 'package:astra_curator/clients/presentation/clients_screen/widgets/sort_popup_menu.dart';
import 'package:astra_curator/core/application/enums/astra_failures.dart';
import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/bars/appbar/main_app_bar.dart';
import 'package:astra_curator/core/presentation/widgets/global/platform.activity_indicator.dart';
import 'package:astra_curator/core/presentation/widgets/scaffolds/error_screens/astra_failure_screen.dart';
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
        title: ClientsTexts.appBarTitle,
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
            if (state.clients.isNotEmpty) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const Divider(color: AstraColors.black01),
                itemCount: state.clients.length,
                itemBuilder: (context, index) {
                  final client = state.clients[index];
                  return ClientTile(
                    dateTime: client.lastDate,
                    id: client.id,
                    name: client.fullName,
                    imageUrl: client.mainImagePath,
                  );
                },
              );
            } else {
              return const Center(child: Text(ClientsTexts.emptyList));
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
