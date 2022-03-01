import 'package:astra_curator/domain/core/services/i_user_unfo_service.dart';
import 'package:astra_curator/domain/profile/models/profile.dart';
import 'package:injectable/injectable.dart';

/// Represent service for getting user profile information.
@LazySingleton(as: IUserInfoService)
class UserInfoService extends IUserInfoService {
  late Profile _userProfile;

  @override
  Profile get userProfile => _userProfile;

  @override
  void setUserProfile(Profile userProfile) {
    _userProfile = userProfile;
  }
}
