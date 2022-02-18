/// Represent element of [TextFieldPopUpMenuItem].
class TextFieldPopUpMenuItem<T> {
  /// Title for displaying in popup menu.
  final String title;

  /// The value of popup menu item.
  final T value;

  TextFieldPopUpMenuItem({
    required this.value,
    required this.title,
  });
}
