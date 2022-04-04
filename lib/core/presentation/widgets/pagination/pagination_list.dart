import 'package:flutter/material.dart';

/// Represent Pagination list widget.
class PaginationList<T> extends StatelessWidget {
  /// Items to display.
  final List<T> items;

  /// Builds content element of pagination list.
  final Widget Function(T item) buildContent;

  /// Next items load event handler.
  final VoidCallback onNextItemsLoaded;

  /// Whether can load next items.
  final bool isAvailableToLoad;

  /// Refresh items event handler.
  final Future<void> Function()? onRefreshItems;
  const PaginationList({
    Key? key,
    required this.items,
    required this.buildContent,
    required this.onNextItemsLoaded,
    required this.isAvailableToLoad,
    required this.onRefreshItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final metrics = notification.metrics;
        final triggerFetchMoreSize = metrics.maxScrollExtent * 0.9;
        if (metrics.pixels > triggerFetchMoreSize && isAvailableToLoad) {
          onNextItemsLoaded();
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: onRefreshItems ?? () async {},
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                buildContent(items[index]),
                if (index == items.length - 1)
                  Visibility(
                    visible: !isAvailableToLoad,
                    child: const CircularProgressIndicator(),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
