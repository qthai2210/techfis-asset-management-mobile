/// Application-wide constants
class AppConstants {
  // Network
  static const int connectionTimeout = 30; // seconds
  static const int receiveTimeout = 30; // seconds

  // Pagination
  static const int defaultPageSize = 10;
  static const int maxPageSize = 100;

  // Base URLs (Environment-based)
  static const String devBaseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://10.0.2.2:3000',
  );
  static const String prodBaseUrl = String.fromEnvironment(
    'PROD_BASE_URL',
    defaultValue: 'https://api.techfis.com',
  );

  // Current environment
  static const bool isProduction = bool.fromEnvironment(
    'IS_PRODUCTION',
    defaultValue: false,
  );
  static String get baseUrl => isProduction ? prodBaseUrl : devBaseUrl;
}
