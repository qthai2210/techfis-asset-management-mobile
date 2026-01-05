import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/dashboard.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardSummary>> getDashboardSummary();
  Future<Either<Failure, List<AssetStatusReport>>> getAssetsByStatus();
  Future<Either<Failure, List<AssetCategoryReport>>> getAssetsByCategory();
  Future<Either<Failure, List<AssignmentReport>>> getRecentAssignments();
}
