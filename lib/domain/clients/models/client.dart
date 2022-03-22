import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.freezed.dart';

/// Represents client model.
@freezed
class Client with _$Client {
  const Client._();
  const factory Client({
    /// Name of the client.
    required String name,

    /// Client's id.
    required String id,

    /// Last entering date time.
    required String dateTime,

    /// Clien's image.
    required String image,
  }) = _Client;
}
