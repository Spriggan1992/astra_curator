/// Describe item of bottom navigation bar.
abstract class INavItem<T> {
  INavItem(this.item);

  /// Tab of nav bar.
  final T item;
}
