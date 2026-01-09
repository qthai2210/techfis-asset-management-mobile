import 'package:dartz/dartz.dart';
import 'package:techfis_asset_management_mobile/core/error/failures.dart';
import 'package:techfis_asset_management_mobile/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String username, String password);
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, bool>> checkAuthStatus();
}
