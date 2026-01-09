import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:techfis_asset_management_mobile/core/error/failures.dart';
import 'package:techfis_asset_management_mobile/core/constants/storage_keys.dart';
import 'package:techfis_asset_management_mobile/features/auth/domain/entities/user.dart';
import 'package:techfis_asset_management_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:techfis_asset_management_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:techfis_asset_management_mobile/core/error/error_handler.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl with ErrorHandler implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final FlutterSecureStorage _storage;

  AuthRepositoryImpl(this._remoteDataSource, this._storage);

  @override
  Future<Either<Failure, User>> login(String username, String password) async {
    return handleRepositoryCall(() async {
      final response = await _remoteDataSource.login(username, password);
      final data = response['data'];

      await _storage.write(
          key: StorageKeys.accessToken, value: data['accessToken']);
      await _storage.write(
          key: StorageKeys.refreshToken, value: data['refreshToken']);

      return await _remoteDataSource.getCurrentUser();
    });
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _remoteDataSource.logout();
      await _storage.deleteAll();
      return const Right(unit);
    } catch (e) {
      // Force clear local storage
      await _storage.deleteAll();
      return const Right(unit);
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    return handleRepositoryCall(() => _remoteDataSource.getCurrentUser());
  }

  @override
  Future<Either<Failure, bool>> checkAuthStatus() async {
    final token = await _storage.read(key: StorageKeys.accessToken);
    if (token != null) {
      return const Right(true);
    }
    return const Right(false);
  }
}
