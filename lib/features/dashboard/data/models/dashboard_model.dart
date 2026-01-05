import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/dashboard.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardSummaryModel extends DashboardSummary {
  const DashboardSummaryModel({
    required super.totalAssets,
    required super.activeAssets,
    required super.inactiveAssets,
    required super.totalAssignments,
    required super.pendingAssignments,
    required super.acceptedAssignments,
    required super.totalAssetValue,
    required super.totalMaintenanceCost,
    required super.userCount,
  });

  factory DashboardSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardSummaryModelToJson(this);
}

@JsonSerializable()
class AssetStatusReportModel extends AssetStatusReport {
  const AssetStatusReportModel({
    required super.status,
    required super.count,
    required super.percentage,
  });

  factory AssetStatusReportModel.fromJson(Map<String, dynamic> json) =>
      _$AssetStatusReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetStatusReportModelToJson(this);
}

@JsonSerializable()
class AssetCategoryReportModel extends AssetCategoryReport {
  const AssetCategoryReportModel({
    required super.categoryId,
    required super.categoryName,
    required super.count,
    required super.totalValue,
    required super.percentage,
  });

  factory AssetCategoryReportModel.fromJson(Map<String, dynamic> json) =>
      _$AssetCategoryReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetCategoryReportModelToJson(this);
}

@JsonSerializable()
class AssignmentReportModel extends AssignmentReport {
  const AssignmentReportModel({
    required super.id,
    required super.assetCode,
    required super.assetName,
    required super.assignedTo,
    required super.status,
    required super.createdAt,
  });

  factory AssignmentReportModel.fromJson(Map<String, dynamic> json) =>
      _$AssignmentReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssignmentReportModelToJson(this);
}

@JsonSerializable()
class AssignmentMetricsModel {
  final List<AssignmentReportModel> data;
  final int total;
  final int totalAccepted;
  final int totalPending;
  final int totalRejected;

  const AssignmentMetricsModel({
    required this.data,
    required this.total,
    required this.totalAccepted,
    required this.totalPending,
    required this.totalRejected,
  });

  factory AssignmentMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$AssignmentMetricsModelFromJson(json);
}

@JsonSerializable()
class CategoryMetricsModel {
  final List<AssetCategoryReportModel> data;
  final int total;

  const CategoryMetricsModel({
    required this.data,
    required this.total,
  });

  factory CategoryMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryMetricsModelFromJson(json);
}
