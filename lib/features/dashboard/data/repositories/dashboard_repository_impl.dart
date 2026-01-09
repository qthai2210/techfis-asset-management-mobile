import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/core/error/failures.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/domain/entities/dashboard.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/data/datasources/dashboard_remote_data_source.dart';

import 'package:techfis_asset_management_mobile/core/error/error_handler.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl with ErrorHandler implements DashboardRepository {
  final DashboardRemoteDataSource _remoteDataSource;

  DashboardRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, DashboardSummary>> getDashboardSummary() async {
    return handleRepositoryCall(() => _remoteDataSource.getDashboardSummary());
  }

  @override
  Future<Either<Failure, List<AssetStatusReport>>> getAssetsByStatus() async {
    return handleRepositoryCall(() => _remoteDataSource.getAssetsByStatus());
  }

  @override
  Future<Either<Failure, List<AssetCategoryReport>>>
      getAssetsByCategory() async {
    return handleRepositoryCall(() async {
      final remoteData = await _remoteDataSource.getAssetsByCategory();
      return remoteData.data;
    });
  }

  @override
  Future<Either<Failure, List<AssignmentReport>>> getRecentAssignments() async {
    return handleRepositoryCall(() => _remoteDataSource.getRecentAssignments());
  }

  @override
  Future<Either<Failure, AssignmentMetrics>> getAssignmentMetrics() async {
    return handleRepositoryCall(() => _remoteDataSource.getAssignmentMetrics());
  }

  @override
  Future<Either<Failure, MaintenanceMetrics>> getMaintenanceMetrics() async {
    return handleRepositoryCall(
        () => _remoteDataSource.getMaintenanceMetrics());
  }

  @override
  Future<Either<Failure, InvoiceMetrics>> getInvoiceMetrics() async {
    return handleRepositoryCall(() => _remoteDataSource.getInvoiceMetrics());
  }
}
