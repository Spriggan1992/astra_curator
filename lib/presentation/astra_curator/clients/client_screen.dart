import 'package:astra_curator/application/clients/clients_bloc.dart';
import 'package:astra_curator/application/clients/clients_sort_types.dart';
import 'package:astra_curator/application/core/enums/astra_failures.dart';
import 'package:astra_curator/presentation/astra_curator/clients/widgets/client_tile.dart';
import 'package:astra_curator/presentation/astra_curator/clients/widgets/sort_popup_menu.dart';
import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/widgets/bars/appbar/main_app_bar.dart';
import 'package:astra_curator/presentation/core/widgets/global/platform.activity_indicator.dart';
import 'package:astra_curator/presentation/core/widgets/scaffolds/error_screens/astra_failure_screen.dart';
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
            const ClientsEvent.sortClients(SortTypes.sortByNameDescending));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        title: 'Клиенты',
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
          if (state.isLoading) {
            return const PlatformActivityIndicator();
          } else if (state.isSuccess) {
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
              return const Center(child: Text('Список пуст.'));
            }
          } else {
            return ErrorScreen(
              failure: (state.isNoConnection)
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
