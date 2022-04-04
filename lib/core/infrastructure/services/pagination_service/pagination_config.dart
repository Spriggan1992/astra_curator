/// Represent configuration for pagination
class PaginationConfig {
  /// Limit items that should be downloaded.
  final int limit;

  /// The offset the loading's items.
  final int offset;

  final String url;
  PaginationConfig({
    required this.url,
    this.limit = 20,
    this.offset = 0,
  });

  /// Parameters for loading data.
  String get queryParameters => '?limit=$limit&offset=$offset';
}
