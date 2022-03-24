import 'package:astra_curator/domain/core/models/image_model.dart';
import 'package:astra_curator/presentation/core/extensions/date_tim_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.freezed.dart';

/// Represents client model.
@freezed
class Client with _$Client {
  const Client._();
  const factory Client({
    // Client's id.
    required int id,

    // Curator's id.
    required int curatorId,

    /// Clien's phone number.
    required String phoneNumber,

    /// Clien's first name.
    required String firstName,

    /// Clien's last name.
    required String lastName,

    /// Clien's age.
    required int? age,

    /// Clien's birthday.
    required String? birthday,

    /// Clien's height.
    required int height,

    /// Clien's gender.
    required String gender,

    /// Clien's status.
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
  }) = _Client;
  
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
