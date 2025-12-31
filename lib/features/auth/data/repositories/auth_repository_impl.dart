import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final FlutterSecureStorage storage;

  AuthRepositoryImpl(this.remoteDataSource, this.storage);

  @override
  Future<Either<Failure, User>> login(String username, String password) async {
    try {
      final response = await remoteDataSource.login(username, password);
      final data = response['data'];

      await storage.write(key: 'accessToken', value: data['accessToken']);
      await storage.write(key: 'refreshToken', value: data['refreshToken']);

      final user = await remoteDataSource.getCurrentUser();
      return Right(user);
    } on ServerException {
      return const Left(ServerFailure('Authentication failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await remoteDataSource.logout();
      await storage.deleteAll();
      return const Right(unit);
    } catch (e) {
      // Force clear local storage
      await storage.deleteAll();
      return const Right(unit);
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      return Right(user);
    } on ServerException {
      return const Left(ServerFailure('Failed to get user'));
    }
  }

  @override
  Future<Either<Failure, bool>> checkAuthStatus() async {
    final token = await storage.read(key: 'accessToken');
    if (token != null) {
      return const Right(true);
    }
    return const Right(false);
  }
}
