import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:hive/hive.dart';
import 'package:techfis_asset_management_mobile/features/assets/data/models/asset_model.dart';
import 'package:techfis_asset_management_mobile/core/constants/app_constants.dart';
import 'package:techfis_asset_management_mobile/core/network/auth_interceptor.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker.createInstance();

  @Named('assetBox')
  @preResolve
  @lazySingleton
  Future<Box<AssetModel>> get assetBox async =>
      await Hive.openBox<AssetModel>('assets_box');

  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: AppConstants.connectionTimeout),
        receiveTimeout: const Duration(seconds: AppConstants.receiveTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors
    dio.interceptors.add(authInterceptor);

    // Enable logging in debug mode
    if (!AppConstants.isProduction) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: false,
        error: true,
        logPrint: (obj) => developer.log('[DIO] $obj'),
      ));
    }

    return dio;
  }
}
