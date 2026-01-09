import 'package:dartz/dartz.dart';
import 'package:techfis_asset_management_mobile/core/error/failures.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/domain/entities/dashboard.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardSummary>> getDashboardSummary();
  Future<Either<Failure, List<AssetStatusReport>>> getAssetsByStatus();
  Future<Either<Failure, List<AssetCategoryReport>>> getAssetsByCategory();
  Future<Either<Failure, List<AssignmentReport>>> getRecentAssignments();
  Future<Either<Failure, AssignmentMetrics>> getAssignmentMetrics();
  Future<Either<Failure, MaintenanceMetrics>> getMaintenanceMetrics();
  Future<Either<Failure, InvoiceMetrics>> getInvoiceMetrics();
}
