// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardSummaryModel _$DashboardSummaryModelFromJson(
        Map<String, dynamic> json) =>
    DashboardSummaryModel(
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
        DashboardSummaryModel instance) =>
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

AssetStatusReportModel _$AssetStatusReportModelFromJson(
        Map<String, dynamic> json) =>
    AssetStatusReportModel(
      status: json['status'] as String,
      count: (json['count'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$AssetStatusReportModelToJson(
        AssetStatusReportModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'percentage': instance.percentage,
    };

AssetCategoryReportModel _$AssetCategoryReportModelFromJson(
        Map<String, dynamic> json) =>
    AssetCategoryReportModel(
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
      count: (json['count'] as num).toInt(),
      totalValue: (json['totalValue'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$AssetCategoryReportModelToJson(
        AssetCategoryReportModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'count': instance.count,
      'totalValue': instance.totalValue,
      'percentage': instance.percentage,
    };

AssignmentReportModel _$AssignmentReportModelFromJson(
        Map<String, dynamic> json) =>
    AssignmentReportModel(
      id: json['id'] as String,
      assetCode: json['assetCode'] as String,
      assetName: json['assetName'] as String,
      assignedTo: json['assignedTo'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AssignmentReportModelToJson(
        AssignmentReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'assetCode': instance.assetCode,
      'assetName': instance.assetName,
      'assignedTo': instance.assignedTo,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
    };

AssignmentMetricsModel _$AssignmentMetricsModelFromJson(
        Map<String, dynamic> json) =>
    AssignmentMetricsModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => AssignmentReportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      totalAccepted: (json['totalAccepted'] as num).toInt(),
      totalPending: (json['totalPending'] as num).toInt(),
      totalRejected: (json['totalRejected'] as num).toInt(),
    );

Map<String, dynamic> _$AssignmentMetricsModelToJson(
        AssignmentMetricsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'totalAccepted': instance.totalAccepted,
      'totalPending': instance.totalPending,
      'totalRejected': instance.totalRejected,
    };

CategoryMetricsModel _$CategoryMetricsModelFromJson(
        Map<String, dynamic> json) =>
    CategoryMetricsModel(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              AssetCategoryReportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$CategoryMetricsModelToJson(
        CategoryMetricsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };
