import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/core/error/failures.dart';
import 'package:techfis_asset_management_mobile/core/usecases/usecase.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/domain/entities/dashboard.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/domain/repositories/dashboard_repository.dart';

@lazySingleton
class GetDashboardDataUseCase implements UseCase<DashboardData, NoParams> {
  final DashboardRepository repository;

  GetDashboardDataUseCase(this.repository);

  @override
  Future<Either<Failure, DashboardData>> call(NoParams params) async {
    final results = await Future.wait([
      repository.getDashboardSummary(),
      repository.getAssetsByStatus(),
      repository.getAssetsByCategory(),
      repository.getAssignmentMetrics(),
      repository.getMaintenanceMetrics(),
      repository.getInvoiceMetrics(),
      repository.getRecentAssignments(),
    ]);

    final summaryResult = results[0] as Either<Failure, DashboardSummary>;
    final statusResult = results[1] as Either<Failure, List<AssetStatusReport>>;
    final categoryResult =
        results[2] as Either<Failure, List<AssetCategoryReport>>;
    final assignmentMetricsResult =
        results[3] as Either<Failure, AssignmentMetrics>;
    final maintenanceMetricsResult =
        results[4] as Either<Failure, MaintenanceMetrics>;
    final invoiceMetricsResult = results[5] as Either<Failure, InvoiceMetrics>;
    final recentAssignmentsResult =
        results[6] as Either<Failure, List<AssignmentReport>>;

    if (summaryResult.isLeft()) {
      return Left(
          summaryResult.fold((l) => l, (r) => throw UnimplementedError()));
    }

    return Right(DashboardData(
      summary: summaryResult.getOrElse(() => throw UnimplementedError()),
      assetsByStatus: statusResult.getOrElse(() => []),
      assetsByCategory: categoryResult.getOrElse(() => []),
      assignmentMetrics: assignmentMetricsResult.getOrElse(() =>
          const AssignmentMetrics(
              total: 0, totalAccepted: 0, totalPending: 0, totalRejected: 0)),
      maintenanceMetrics: maintenanceMetricsResult.getOrElse(() =>
          const MaintenanceMetrics(
              total: 0,
              totalCompleted: 0,
              totalInProgress: 0,
              totalScheduled: 0,
              totalFailed: 0)),
      invoiceMetrics: invoiceMetricsResult.getOrElse(() => const InvoiceMetrics(
          total: 0,
          totalPaid: 0,
          totalPending: 0,
          totalOverdue: 0,
          totalDraft: 0)),
      recentAssignments: recentAssignmentsResult.getOrElse(() => []),
    ));
  }
}

class DashboardData {
  final DashboardSummary summary;
  final List<AssetStatusReport> assetsByStatus;
  final List<AssetCategoryReport> assetsByCategory;
  final List<AssignmentReport> recentAssignments;
  final AssignmentMetrics assignmentMetrics;
  final MaintenanceMetrics maintenanceMetrics;
  final InvoiceMetrics invoiceMetrics;

  DashboardData({
    required this.summary,
    required this.assetsByStatus,
    required this.assetsByCategory,
    required this.recentAssignments,
    required this.assignmentMetrics,
    required this.maintenanceMetrics,
    required this.invoiceMetrics,
  });
}
