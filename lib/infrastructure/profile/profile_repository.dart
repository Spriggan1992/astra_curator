import 'package:astra_curator/domain/core/failure/astra_failure.dart';
import 'package:astra_curator/domain/profile/models/profile.dart';
import 'package:astra_curator/domain/profile/repositories/i_profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const _images = 'images';
const _astraImages = 'astraImages';

@LazySingleton(as: IProfileRepository)

/// Profile api.
class ProfileRepository implements IProfileRepository {
  /// Dio client.
  final Dio _dio;

  

  ProfileRepository(this._dio);

  @override
  Future<Either<AstraFailure, Profile>> getProfile() async {
    // final result = await makeRequest<Profile>(() async {
    //   final response = await _dio.get(Endpoints.user.account);
    //   final profile = ProfileDTO.fromJson(response.data).toDomain();
    //   final imageModels = await _getImageModels(profile.profilePhotos);
    //   final updatedProfile = profile.copyWith(profilePhotos: imageModels);
    //   return updatedProfile;
    // });
    // return result.fold((l) => left(l), (r) => right(r));
    return right(Profile.empty()); 
  }

 }
