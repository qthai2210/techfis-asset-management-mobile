// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/domain/entities/dashboard.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

@freezed
abstract class DashboardSummaryModel
    with _$DashboardSummaryModel
    implements DashboardSummary {
  const DashboardSummaryModel._();

  const factory DashboardSummaryModel({
    required int totalAssets,
    required int activeAssets,
    required int inactiveAssets,
    required int totalAssignments,
    required int pendingAssignments,
    required int acceptedAssignments,
    required double totalAssetValue,
    required double totalMaintenanceCost,
    required int userCount,
  }) = _DashboardSummaryModel;

  factory DashboardSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryModelFromJson(json);

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

  @override
  bool? get stringify => true;
}

@freezed
abstract class AssetStatusReportModel
    with _$AssetStatusReportModel
    implements AssetStatusReport {
  const AssetStatusReportModel._();

  const factory AssetStatusReportModel({
    required String status,
    required int count,
    required double percentage,
  }) = _AssetStatusReportModel;

  factory AssetStatusReportModel.fromJson(Map<String, dynamic> json) =>
      _$AssetStatusReportModelFromJson(json);

  @override
  List<Object?> get props => [status, count, percentage];

  @override
  bool? get stringify => true;
}

@freezed
abstract class AssetCategoryReportModel
    with _$AssetCategoryReportModel
    implements AssetCategoryReport {
  const AssetCategoryReportModel._();

  const factory AssetCategoryReportModel({
    required String categoryId,
    required String categoryName,
    required int count,
    required double totalValue,
    required double percentage,
  }) = _AssetCategoryReportModel;

  factory AssetCategoryReportModel.fromJson(Map<String, dynamic> json) =>
      _$AssetCategoryReportModelFromJson(json);

  @override
  List<Object?> get props =>
      [categoryId, categoryName, count, totalValue, percentage];

  @override
  bool? get stringify => true;
}

@freezed
abstract class AssignmentReportModel
    with _$AssignmentReportModel
    implements AssignmentReport {
  const AssignmentReportModel._();

  const factory AssignmentReportModel({
    required String id,
    @Default('N/A') String assetCode,
    @JsonKey(name: 'assetName') required String assetName,
    @JsonKey(name: 'assignedToName') required String assignedTo,
    @Default('PENDING') String status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _AssignmentReportModel;

  factory AssignmentReportModel.fromJson(Map<String, dynamic> json) =>
      _$AssignmentReportModelFromJson(json);

  @override
  List<Object?> get props =>
      [id, assetCode, assetName, assignedTo, status, createdAt];

  @override
  bool? get stringify => true;
}

@freezed
abstract class AssignmentMetricsModel
    with _$AssignmentMetricsModel
    implements AssignmentMetrics {
  const AssignmentMetricsModel._();

  const factory AssignmentMetricsModel({
    required int total,
    required int totalAccepted,
    required int totalPending,
    required int totalRejected,
  }) = _AssignmentMetricsModel;

  factory AssignmentMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$AssignmentMetricsModelFromJson(json);

  @override
  List<Object?> get props =>
      [total, totalAccepted, totalPending, totalRejected];

  @override
  bool? get stringify => true;
}

@freezed
abstract class InvoiceMetricsModel
    with _$InvoiceMetricsModel
    implements InvoiceMetrics {
  const InvoiceMetricsModel._();

  const factory InvoiceMetricsModel({
    required int total,
    required int totalPaid,
    required int totalPending,
    required int totalOverdue,
    required int totalDraft,
  }) = _InvoiceMetricsModel;

  factory InvoiceMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceMetricsModelFromJson(json);

  @override
  List<Object?> get props =>
      [total, totalPaid, totalPending, totalOverdue, totalDraft];

  @override
  bool? get stringify => true;
}

@freezed
abstract class MaintenanceMetricsModel
    with _$MaintenanceMetricsModel
    implements MaintenanceMetrics {
  const MaintenanceMetricsModel._();

  const factory MaintenanceMetricsModel({
    required int total,
    required int totalCompleted,
    required int totalInProgress,
    required int totalScheduled,
    required int totalFailed,
  }) = _MaintenanceMetricsModel;

  factory MaintenanceMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceMetricsModelFromJson(json);

  @override
  List<Object?> get props =>
      [total, totalCompleted, totalInProgress, totalScheduled, totalFailed];

  @override
  bool? get stringify => true;
}

@freezed
abstract class CategoryMetricsModel with _$CategoryMetricsModel {
  const CategoryMetricsModel._();

  const factory CategoryMetricsModel({
    required List<AssetCategoryReportModel> data,
    required int total,
  }) = _CategoryMetricsModel;

  factory CategoryMetricsModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryMetricsModelFromJson(json);
}
