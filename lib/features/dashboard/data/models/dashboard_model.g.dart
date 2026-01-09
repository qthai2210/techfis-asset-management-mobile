// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardSummaryModel _$DashboardSummaryModelFromJson(
        Map<String, dynamic> json) =>
    _DashboardSummaryModel(
      totalAssets: (json['totalAssets'] as num).toInt(),
      activeAssets: (json['activeAssets'] as num).toInt(),
      inactiveAssets: (json['inactiveAssets'] as num).toInt(),
      totalAssignments: (json['totalAssignments'] as num).toInt(),
      pendingAssignments: (json['pendingAssignments'] as num).toInt(),
      acceptedAssignments: (json['acceptedAssignments'] as num).toInt(),
      totalAssetValue: (json['totalAssetValue'] as num).toDouble(),
      totalMaintenanceCost: (json['totalMaintenanceCost'] as num).toDouble(),
      userCount: (json['userCount'] as num).toInt(),
    );

Map<String, dynamic> _$DashboardSummaryModelToJson(
        _DashboardSummaryModel instance) =>
    <String, dynamic>{
      'totalAssets': instance.totalAssets,
      'activeAssets': instance.activeAssets,
      'inactiveAssets': instance.inactiveAssets,
      'totalAssignments': instance.totalAssignments,
      'pendingAssignments': instance.pendingAssignments,
      'acceptedAssignments': instance.acceptedAssignments,
      'totalAssetValue': instance.totalAssetValue,
      'totalMaintenanceCost': instance.totalMaintenanceCost,
      'userCount': instance.userCount,
    };

_AssetStatusReportModel _$AssetStatusReportModelFromJson(
        Map<String, dynamic> json) =>
    _AssetStatusReportModel(
      status: json['status'] as String,
      count: (json['count'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$AssetStatusReportModelToJson(
        _AssetStatusReportModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'percentage': instance.percentage,
    };

_AssetCategoryReportModel _$AssetCategoryReportModelFromJson(
        Map<String, dynamic> json) =>
    _AssetCategoryReportModel(
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
      count: (json['count'] as num).toInt(),
      totalValue: (json['totalValue'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$AssetCategoryReportModelToJson(
        _AssetCategoryReportModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'count': instance.count,
      'totalValue': instance.totalValue,
      'percentage': instance.percentage,
    };

_AssignmentReportModel _$AssignmentReportModelFromJson(
        Map<String, dynamic> json) =>
    _AssignmentReportModel(
      id: json['id'] as String,
      assetCode: json['assetCode'] as String? ?? 'N/A',
      assetName: json['assetName'] as String,
      assignedTo: json['assignedToName'] as String,
      status: json['status'] as String? ?? 'PENDING',
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$AssignmentReportModelToJson(
        _AssignmentReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assetCode': instance.assetCode,
      'assetName': instance.assetName,
      'assignedToName': instance.assignedTo,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
    };

_AssignmentMetricsModel _$AssignmentMetricsModelFromJson(
        Map<String, dynamic> json) =>
    _AssignmentMetricsModel(
      total: (json['total'] as num).toInt(),
      totalAccepted: (json['totalAccepted'] as num).toInt(),
      totalPending: (json['totalPending'] as num).toInt(),
      totalRejected: (json['totalRejected'] as num).toInt(),
    );

Map<String, dynamic> _$AssignmentMetricsModelToJson(
        _AssignmentMetricsModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalAccepted': instance.totalAccepted,
      'totalPending': instance.totalPending,
      'totalRejected': instance.totalRejected,
    };

_InvoiceMetricsModel _$InvoiceMetricsModelFromJson(Map<String, dynamic> json) =>
    _InvoiceMetricsModel(
      total: (json['total'] as num).toInt(),
      totalPaid: (json['totalPaid'] as num).toInt(),
      totalPending: (json['totalPending'] as num).toInt(),
      totalOverdue: (json['totalOverdue'] as num).toInt(),
      totalDraft: (json['totalDraft'] as num).toInt(),
    );

Map<String, dynamic> _$InvoiceMetricsModelToJson(
        _InvoiceMetricsModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalPaid': instance.totalPaid,
      'totalPending': instance.totalPending,
      'totalOverdue': instance.totalOverdue,
      'totalDraft': instance.totalDraft,
    };

_MaintenanceMetricsModel _$MaintenanceMetricsModelFromJson(
        Map<String, dynamic> json) =>
    _MaintenanceMetricsModel(
      total: (json['total'] as num).toInt(),
      totalCompleted: (json['totalCompleted'] as num).toInt(),
      totalInProgress: (json['totalInProgress'] as num).toInt(),
      totalScheduled: (json['totalScheduled'] as num).toInt(),
      totalFailed: (json['totalFailed'] as num).toInt(),
    );

Map<String, dynamic> _$MaintenanceMetricsModelToJson(
        _MaintenanceMetricsModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalCompleted': instance.totalCompleted,
      'totalInProgress': instance.totalInProgress,
      'totalScheduled': instance.totalScheduled,
      'totalFailed': instance.totalFailed,
    };

_CategoryMetricsModel _$CategoryMetricsModelFromJson(
        Map<String, dynamic> json) =>
    _CategoryMetricsModel(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              AssetCategoryReportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$CategoryMetricsModelToJson(
        _CategoryMetricsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };
