import 'package:astra_curator/core/domain/models/image_model.dart';
import 'package:astra_curator/core/presentation/extensions/date_tim_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.freezed.dart';

/// Represents client model.
@freezed
class ClientModel with _$ClientModel {
  const ClientModel._();
  const factory ClientModel({
    // Client's id.
    required int id,

    // Curator's id.
    required int curatorId,

    /// Client's phone number.
    required String phoneNumber,

    /// Client's first name.
    required String firstName,

    /// Client's last name.
    required String lastName,

    /// Client's age.
    required int? age,

    /// Client's birthday.
    required String? birthday,

    /// Client's height.
    required int height,

    /// Client's gender.
    required String gender,

    /// Client's status.
    required String status,

    /// A flag showing clien's has child or not.
    required bool haveChild,

    /// Client's country.
    required String country,

    /// Client's city.
    required String city,

    /// Client's profile info.
    required String profileInfo,

    /// A date time that client was created.
    required String createdAt,

    /// A date time that client was saved at.
    required String savedAt,

    /// A flag shows that client is active or not active.
    required bool isActive,

    /// A flag shows that client is draft or not.
    required bool draft,

    /// A flag shows that client is hidden or not.
    required bool isHidden,

    /// A flag shows that client is show info or not.
    required bool showInfo,

    /// A flag shows that client is mutual like or not.
    required bool? isMutualLike,

    /// Client's curator first name.
    required String curatorFirstname,

    /// Client's curator last name.
    required String curatorLastname,

    /// A flag shows that client is online or not.
    required bool? isOnline,

    /// Client's like amount.
    required int likesAmount,

    /// Client's profile images.
    required List<ImageModel> profilePhotos,

    /// Client's curator images.
    required List<ImageModel> curatorPhotos,
  }) = _ClientModel;

  /// Client's fullName.
  String get fullName => "$firstName $lastName";

  /// The first client's image.
  String get mainImagePath =>
      profilePhotos.isNotEmpty ? profilePhotos.first.imageUrl : '';

  /// Last entered date time.
  String get lastDate {
    final date = DateTime.tryParse(createdAt);
    if (date != null) {
      return date.dateTimeClientFormat();
    }

    return '';
  }
}
