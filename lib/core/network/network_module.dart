import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'auth_interceptor.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:3000/api/v1', // Android Emulator localhost
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(authInterceptor);
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    return dio;
  }
}
