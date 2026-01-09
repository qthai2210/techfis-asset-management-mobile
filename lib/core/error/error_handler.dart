import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:techfis_asset_management_mobile/core/error/exceptions.dart';
import 'package:techfis_asset_management_mobile/core/error/failures.dart';

mixin ErrorHandler {
  Future<Either<Failure, T>> handleRepositoryCall<T>(
    Future<T> Function() call,
  ) async {
    try {
      final result = await call();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on DioException catch (e) {
      return Left(mapDioExceptionToFailure(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Failure mapDioExceptionToFailure(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure('connectionTimedOut');
      case DioExceptionType.badResponse:
        final message = e.response?.data['message'] ?? 'serverError';
        final statusCode = e.response?.statusCode;
        if (statusCode == 401 || statusCode == 403) {
          return AuthFailure(message);
        }
        if (statusCode == 400) {
          return ValidationFailure(message);
        }
        return ServerFailure(message);
      case DioExceptionType.cancel:
        return const ServerFailure('requestCancelled');
      case DioExceptionType.connectionError:
        return const NetworkFailure('noInternetConnection');
      default:
        return ServerFailure(e.message ?? 'unknownError');
    }
  }
}
