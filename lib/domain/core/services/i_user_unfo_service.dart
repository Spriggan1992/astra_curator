import 'package:astra_curator/domain/profile/models/profile.dart';

/// Describes the user information service.
abstract class IUserInfoService {
  /// Returns user profile.
  Profile get userProfile;

  /// Set user profile.
  ///
  /// `userProfile` User profile.
  void setUserProfile(Profile userProfile);
}
