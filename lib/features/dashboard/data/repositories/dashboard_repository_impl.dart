import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/dashboard.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_data_source.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, DashboardSummary>> getDashboardSummary() async {
    try {
      final remoteData = await remoteDataSource.getDashboardSummary();
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure('Server Error'));
    }
  }

  @override
  Future<Either<Failure, List<AssetStatusReport>>> getAssetsByStatus() async {
    try {
      final remoteData = await remoteDataSource.getAssetsByStatus();
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure('Server Error'));
    }
  }

  @override
  Future<Either<Failure, List<AssetCategoryReport>>>
      getAssetsByCategory() async {
    try {
      final remoteData = await remoteDataSource.getAssetsByCategory();
      return Right(remoteData.data);
    } on ServerException {
      return Left(ServerFailure('Server Error'));
    }
  }

  @override
  Future<Either<Failure, List<AssignmentReport>>> getRecentAssignments() async {
    try {
      final remoteData = await remoteDataSource.getAssignmentMetrics();
      return Right(remoteData.data);
    } on ServerException {
      return Left(ServerFailure('Server Error'));
    }
  }
}
