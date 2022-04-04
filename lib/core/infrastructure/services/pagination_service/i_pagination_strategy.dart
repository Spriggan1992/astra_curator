/// Describe strategy of pagination.
abstract class IPaginationStrategy<T> {
  /// Pars json.
  T parseJson(List<dynamic> jsons);
}
