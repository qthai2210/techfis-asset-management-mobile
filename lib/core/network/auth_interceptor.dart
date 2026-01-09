import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'package:techfis_asset_management_mobile/core/constants/storage_keys.dart';
import 'package:techfis_asset_management_mobile/core/constants/api_constants.dart';
import 'package:techfis_asset_management_mobile/core/constants/app_constants.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;
  final Dio _tokenDio; // Separate Dio instance for token operations

  bool _isRefreshing = false;
  Completer<String?>? _refreshCompleter;

  AuthInterceptor(this._storage)
      : _tokenDio = Dio(BaseOptions(
          baseUrl: AppConstants.baseUrl,
          connectTimeout:
              const Duration(seconds: AppConstants.connectionTimeout),
          receiveTimeout: const Duration(seconds: AppConstants.receiveTimeout),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ));

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storage.read(key: StorageKeys.accessToken);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized - Token expired
    if (err.response?.statusCode == 401) {
      // If refresh token request itself failed, don't retry, just fail
      if (err.requestOptions.path.contains(ApiConstants.refreshToken)) {
        await _performLogout();
        return handler.next(err);
      }

      if (_isRefreshing) {
        // If already refreshing, wait for the result
        if (_refreshCompleter != null && !_refreshCompleter!.isCompleted) {
          try {
            final newToken = await _refreshCompleter!.future;
            if (newToken != null) {
              // Update the header with the new token
              err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
              // Retry the request
              final retryResponse = await _tokenDio.fetch(err.requestOptions);
              return handler.resolve(retryResponse);
            }
          } catch (e) {
            // If refresh failed, reject original request
            return handler.reject(err);
          }
        }
      }

      _isRefreshing = true;
      _refreshCompleter = Completer<String?>();

      try {
        final refreshToken = await _storage.read(key: StorageKeys.refreshToken);

        if (refreshToken != null) {
          // Attempt to refresh token
          // Use _tokenDio to avoid passing through this interceptor again
          final response = await _tokenDio.post(
            ApiConstants.refreshToken,
            data: {'refreshToken': refreshToken},
          );

          if (response.statusCode == 200) {
            final data = response
                .data['data']; // Assuming standard response { data: ... }
            final newAccessToken = data['accessToken'];
            final newRefreshToken = data['refreshToken'];

            if (newAccessToken != null && newRefreshToken != null) {
              // Save new tokens
              await _storage.write(
                key: StorageKeys.accessToken,
                value: newAccessToken,
              );
              await _storage.write(
                key: StorageKeys.refreshToken,
                value: newRefreshToken,
              );

              _isRefreshing = false;
              _refreshCompleter!.complete(newAccessToken);

              // Retry the original request with new token
              err.requestOptions.headers['Authorization'] =
                  'Bearer $newAccessToken';
              final retryResponse = await _tokenDio.fetch(err.requestOptions);
              return handler.resolve(retryResponse);
            }
          }
        }

        // If we reach here, refresh failed
        await _performLogout();
        _isRefreshing = false;
        _refreshCompleter!.complete(null);
        return handler.reject(err);
      } catch (e) {
        // Refresh failed (network error, invalid token, etc.)
        await _performLogout();
        _isRefreshing = false;
        _refreshCompleter!.completeError(e);
        return handler.reject(err);
      }
    }

    handler.next(err);
  }

  Future<void> _performLogout() async {
    await _storage.deleteAll();
    // Navigation to login screen is usually handled by listening to AuthState changes in the UI/Router
  }
}
