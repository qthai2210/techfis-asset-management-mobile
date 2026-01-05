import 'package:equatable/equatable.dart';

class DashboardSummary extends Equatable {
  final int totalAssets;
  final int activeAssets;
  final int inactiveAssets;
  final int totalAssignments;
  final int pendingAssignments;
  final int acceptedAssignments;
  final double totalAssetValue;
  final double totalMaintenanceCost;
  final int userCount;

  const DashboardSummary({
    required this.totalAssets,
    required this.activeAssets,
    required this.inactiveAssets,
    required this.totalAssignments,
    required this.pendingAssignments,
    required this.acceptedAssignments,
    required this.totalAssetValue,
    required this.totalMaintenanceCost,
    required this.userCount,
  });

  @override
  List<Object?> get props => [
        totalAssets,
        activeAssets,
        inactiveAssets,
        totalAssignments,
        pendingAssignments,
        acceptedAssignments,
        totalAssetValue,
        totalMaintenanceCost,
        userCount,
      ];
}

class AssetStatusReport extends Equatable {
  final String status;
  final int count;
  final double percentage;

  const AssetStatusReport({
    required this.status,
    required this.count,
    required this.percentage,
  });

  @override
  List<Object?> get props => [status, count, percentage];
}

class AssetCategoryReport extends Equatable {
  final String categoryId;
  final String categoryName;
  final int count;
  final double totalValue;
  final double percentage;

  const AssetCategoryReport({
    required this.categoryId,
    required this.categoryName,
    required this.count,
    required this.totalValue,
    required this.percentage,
  });

  @override
  List<Object?> get props => [
        categoryId,
        categoryName,
        count,
        totalValue,
        percentage,
      ];
}

class AssignmentReport extends Equatable {
  final String id;
  final String assetCode;
  final String assetName;
  final String assignedTo;
  final String status;
  final DateTime createdAt;

  const AssignmentReport({
    required this.id,
    required this.assetCode,
    required this.assetName,
    required this.assignedTo,
    required this.status,
    required this.createdAt,
  });

  @override
  List<Object?> get props =>
      [id, assetCode, assetName, assignedTo, status, createdAt];
}
