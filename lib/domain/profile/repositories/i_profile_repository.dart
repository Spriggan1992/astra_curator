
import 'package:astra_curator/domain/core/failure/astra_failure.dart';
import 'package:astra_curator/domain/profile/models/profile.dart';
import 'package:dartz/dartz.dart';

/// Describe profile api.
abstract class IProfileRepository {
  /// Load profile information
  Future<Either<AstraFailure, Profile>> getProfile();

 
}
