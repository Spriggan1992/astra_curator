import 'package:astra_curator/pagination/application/pagination_bloc.dart';
import 'package:astra_curator/pagination/presentation/pagination_list_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent pagination list view.
class PaginationListView<T> extends StatelessWidget {
  /// Builds content element of pagination list.
  final Widget Function(T item) buildContent;

  const PaginationListView({
    Key? key,
    required this.buildContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationBloc<T>, PaginationState<T>>(
      builder: (context, state) {
        return PaginationListBase<T>(
          onRefreshItems: () async {
            context
                .read<PaginationBloc<T>>()
                .add(const PaginationEvent.loadClients(isRefreshItems: true));
          },
          items: state.paginationModel.items ?? [],
          buildContent: buildContent,
          onNextItemsLoaded: () {
            context
                .read<PaginationBloc<T>>()
                .add(const PaginationEvent.loadClients(isRefreshItems: false));
          },
          isAvailableToLoad: state.isAvailableToLoad,
        );
      },
    );
  }
}
