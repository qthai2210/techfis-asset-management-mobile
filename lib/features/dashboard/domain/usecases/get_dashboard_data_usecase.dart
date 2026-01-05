import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/dashboard.dart';
import '../repositories/dashboard_repository.dart';

@lazySingleton
class GetDashboardDataUseCase implements UseCase<DashboardData, NoParams> {
  final DashboardRepository repository;

  GetDashboardDataUseCase(this.repository);

  @override
  Future<Either<Failure, DashboardData>> call(NoParams params) async {
    // Parallel execution for efficiency
    final results = await Future.wait([
      repository.getDashboardSummary(),
      repository.getAssetsByStatus(),
      repository.getAssetsByCategory(),
      repository.getRecentAssignments(),
    ]);

    // Check if any failed? For now, if summary fails, we fail.
    // Others can be empty lists if failed, but UseCase typically returns one Failure.
    // Let's simplify: All must succeed, or we return the first failure.

    final summaryResult = results[0] as Either<Failure, DashboardSummary>;
    if (summaryResult.isLeft())
      return Left(
          summaryResult.fold((l) => l, (r) => throw UnimplementedError()));

    final statusResult = results[1] as Either<Failure, List<AssetStatusReport>>;
    final categoryResult =
        results[2] as Either<Failure, List<AssetCategoryReport>>;
    final assignmentResult =
        results[3] as Either<Failure, List<AssignmentReport>>;

    return Right(DashboardData(
      summary: summaryResult.getOrElse(() => throw UnimplementedError()),
      assetsByStatus: statusResult.getOrElse(() => []),
      assetsByCategory: categoryResult.getOrElse(() => []),
      recentAssignments: assignmentResult.getOrElse(() => []),
    ));
  }
}

class DashboardData {
  final DashboardSummary summary;
  final List<AssetStatusReport> assetsByStatus;
  final List<AssetCategoryReport> assetsByCategory;
  final List<AssignmentReport> recentAssignments;

  DashboardData({
    required this.summary,
    required this.assetsByStatus,
    required this.assetsByCategory,
    required this.recentAssignments,
  });
}
