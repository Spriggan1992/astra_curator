/// Extension on int.
extension EndingX on int {
  /// Return ending of string representation of likes, depending on amount of likes.
  String get likeEnding {
    if (this == 1) {
      return "лайк";
    } else if (this > 1 && this < 5) {
      return "лайка";
    } else {
      return "лайков";
    }
  }
}
