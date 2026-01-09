import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/core/error/exceptions.dart';
import 'package:techfis_asset_management_mobile/core/constants/api_constants.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/data/models/dashboard_model.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardSummaryModel> getDashboardSummary();
  Future<List<AssetStatusReportModel>> getAssetsByStatus();
  Future<CategoryMetricsModel> getAssetsByCategory();
  Future<List<AssignmentReportModel>> getRecentAssignments();
  Future<AssignmentMetricsModel> getAssignmentMetrics();
  Future<MaintenanceMetricsModel> getMaintenanceMetrics();
  Future<InvoiceMetricsModel> getInvoiceMetrics();
}

@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final Dio dio;

  DashboardRemoteDataSourceImpl(this.dio);

  @override
  Future<DashboardSummaryModel> getDashboardSummary() async {
    try {
      final response = await dio.get(ApiConstants.dashboardSummary);
      return DashboardSummaryModel.fromJson(response.data['data']);
    } catch (e) {
      throw ServerException(message: 'Failed to load dashboard: $e');
    }
  }

  @override
  Future<List<AssetStatusReportModel>> getAssetsByStatus() async {
    try {
      final response = await dio.get(ApiConstants.assetStatusDistribution);
      final data = response.data['data'];

      // Backend returns a direct list of status reports: [{status: 'ACTIVE', count: 30, ...}, ...]
      if (data is List) {
        return data.map((e) => AssetStatusReportModel.fromJson(e)).toList();
      } else if (data is Map && data.containsKey('summary')) {
        // Fallback for previous structure if any
        return (data['summary'] as List)
            .map((e) => AssetStatusReportModel.fromJson(e))
            .toList();
      }
      return [];
    } catch (e) {
      // Catch all exceptions to prevent crash proliferation
      throw ServerException(message: 'Failed to load asset status: $e');
    }
  }

  @override
  Future<CategoryMetricsModel> getAssetsByCategory() async {
    try {
      final response = await dio.get(ApiConstants.assetsByCategory);
      final json = response.data['data'];
      try {
        return CategoryMetricsModel.fromJson(json);
      } catch (_) {
        // Fallback if 'total' is missing or structure doesn't match exactly
        if (json is Map && json.containsKey('data') && json['data'] is List) {
          final list = (json['data'] as List)
              .map((e) => AssetCategoryReportModel.fromJson(e))
              .toList();
          return CategoryMetricsModel(data: list, total: list.length);
        }
        rethrow;
      }
    } catch (e) {
      throw ServerException(message: 'Failed to load categories: $e');
    }
  }

  @override
  Future<List<AssignmentReportModel>> getRecentAssignments() async {
    try {
      final response = await dio.get(
        ApiConstants.assignments,
        queryParameters: {'take': 5, 'sort': 'createdAt:desc'},
      );
      final data = response.data['data']['data'];
      if (data is List) {
        return data
            .map((e) {
              // Handle missing fields manually if needed, or let fromJson try
              // If assetCode is missing, we might need a workaround if it's required in Model
              // For now, we wrap in try-catch per item to skip bad items
              try {
                // Temporary fix: inject 'assetCode' if missing since it's required
                final map = e as Map<String, dynamic>;
                if (!map.containsKey('assetCode')) {
                  map['assetCode'] = 'N/A';
                }
                return AssignmentReportModel.fromJson(map);
              } catch (e) {
                debugPrint('Error parsing assignment: $e');
                return null;
              }
            })
            .whereType<AssignmentReportModel>()
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<AssignmentMetricsModel> getAssignmentMetrics() async {
    try {
      final response = await dio.get(ApiConstants.assignmentMetrics);
      // Backend now returns { total, totalAccepted, totalPending, totalRejected }
      return AssignmentMetricsModel.fromJson(response.data['data']);
    } catch (e) {
      throw ServerException(message: 'Failed to load assignment metrics: $e');
    }
  }

  @override
  Future<MaintenanceMetricsModel> getMaintenanceMetrics() async {
    try {
      final response = await dio.get(ApiConstants.maintenanceMetrics);
      return MaintenanceMetricsModel.fromJson(response.data['data']);
    } catch (e) {
      throw ServerException(message: 'Failed to load maintenance metrics: $e');
    }
  }

  @override
  Future<InvoiceMetricsModel> getInvoiceMetrics() async {
    try {
      final response = await dio.get(ApiConstants.invoiceMetrics);
      return InvoiceMetricsModel.fromJson(response.data['data']);
    } catch (e) {
      throw ServerException(message: 'Failed to load invoice metrics: $e');
    }
  }
}
