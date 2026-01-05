import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../models/dashboard_model.dart';
import '../../domain/entities/dashboard.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardSummaryModel> getDashboardSummary();
  Future<List<AssetStatusReportModel>> getAssetsByStatus();
  Future<CategoryMetricsModel> getAssetsByCategory();
  Future<AssignmentMetricsModel> getAssignmentMetrics();
}

@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final Dio dio;

  DashboardRemoteDataSourceImpl(this.dio);

  @override
  Future<DashboardSummaryModel> getDashboardSummary() async {
    try {
      final response = await dio.get('/reports/dashboard');
      return DashboardSummaryModel.fromJson(response.data['data']);
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<List<AssetStatusReportModel>> getAssetsByStatus() async {
    try {
      final response = await dio.get('/reports/assets/by-status');
      return (response.data['data'] as List)
          .map((e) => AssetStatusReportModel.fromJson(e))
          .toList();
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<CategoryMetricsModel> getAssetsByCategory() async {
    try {
      final response = await dio.get('/reports/assets/by-category');
      return CategoryMetricsModel.fromJson(response.data['data']);
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<AssignmentMetricsModel> getAssignmentMetrics() async {
    try {
      final response = await dio.get('/reports/assignments');
      return AssignmentMetricsModel.fromJson(response.data['data']);
    } on DioException {
      throw ServerException();
    }
  }
}
