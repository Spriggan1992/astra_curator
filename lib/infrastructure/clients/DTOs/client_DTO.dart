import 'package:astra_curator/domain/clients/models/client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'client_DTO.freezed.dart';
part 'client_DTO.g.dart';

/// Represents Client_DTO model.
@freezed
class ClientDTO with _$ClientDTO {
  const ClientDTO._();
  const factory ClientDTO({
    /// Client's name.
    @JsonKey(name: 'name') required String name,

    /// Client's id.
    @JsonKey(name: 'id') required String id,

    /// Client's last entered date time.
    @JsonKey(name: 'dateTime') required String dateTime,

    /// Client's image.
    @JsonKey(name: 'image') required String image,
  }) = _ClientDTO;

  /// Return converted DTO from json.
  factory ClientDTO.fromJson(Map<String, dynamic> json) =>
      _$ClientDTOFromJson(json);

  /// Converted to client model.
  Client toDomain() => Client(
        id: id,
        name: name,
        dateTime: dateTime,
        image: image,
      );

  /// Client DTO from client model.
  factory ClientDTO.fromDomain(Client _) => ClientDTO(
        name: _.name,
        id: _.id,
        dateTime: _.dateTime,
        image: _.image,
      );
}
