import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/core/error/exceptions.dart';
import 'package:techfis_asset_management_mobile/core/constants/api_constants.dart';
import 'package:techfis_asset_management_mobile/core/network/dio_client.dart';
import 'package:techfis_asset_management_mobile/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String username, String password);
  Future<void> logout();
  Future<UserModel> getCurrentUser();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient client;
  final FlutterSecureStorage storage;

  AuthRemoteDataSourceImpl(this.client, this.storage);

  @override
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await client.post(ApiConstants.login, data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw ServerException(message: 'Login failed');
      }
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['message'] ?? 'Authentication failed',
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      await client.post(ApiConstants.logout);
    } catch (_) {
      // Ignore logout errors - local cleanup is more important
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final response = await client.get(ApiConstants.me);
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['data']);
      } else {
        throw ServerException(message: 'Failed to get user info');
      }
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['message'] ?? 'Failed to get user info',
      );
    }
  }
}
