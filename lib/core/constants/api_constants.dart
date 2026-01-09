/// API endpoint constants
class ApiConstants {
  // Base
  static const String apiVersion = '/api/v1';

  // Auth endpoints
  static const String login = '$apiVersion/auth/login';
  static const String logout = '$apiVersion/auth/logout';
  static const String me = '$apiVersion/auth/me';
  static const String refreshToken = '$apiVersion/auth/refresh-token';

  // Reporting endpoints
  // Reporting endpoints
  static const String dashboardSummary =
      '$apiVersion/reporting/dashboard-summary';
  static const String assetStatusDistribution =
      '$apiVersion/reporting/assets/by-status';
  static const String assetsByCategory =
      '$apiVersion/reporting/assets/by-category';
  static const String assignmentMetrics = '$apiVersion/reporting/assignments';
  static const String maintenanceMetrics =
      '$apiVersion/reporting/maintenance-metrics';
  static const String invoiceMetrics = '$apiVersion/reporting/invoice-metrics';
  static const String assetValueTrend =
      '$apiVersion/reporting/charts/asset-value-trend';

  // Asset endpoints
  static const String assets = '$apiVersion/assets';
  static String assetDetail(String id) => '$assets/$id';

  // Assignment endpoints
  static const String assignments = '$apiVersion/assignments';
  static String assignmentDetail(String id) => '$assignments/$id';
}
