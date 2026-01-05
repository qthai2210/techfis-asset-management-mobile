// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/network/auth_interceptor.dart' as _i8;
import 'core/network/network_module.dart' as _i550;
import 'core/services/storage_module.dart' as _i884;
import 'features/auth/data/datasources/auth_remote_data_source.dart' as _i767;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i111;
import 'features/auth/domain/repositories/auth_repository.dart' as _i1015;
import 'features/auth/domain/usecases/login_usecase.dart' as _i206;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i363;
import 'features/dashboard/data/datasources/dashboard_remote_data_source.dart'
    as _i989;
import 'features/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i448;
import 'features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i557;
import 'features/dashboard/domain/usecases/get_dashboard_data_usecase.dart'
    as _i319;
import 'features/dashboard/presentation/bloc/dashboard_bloc.dart' as _i521;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => storageModule.secureStorage);
    gh.factory<_i8.AuthInterceptor>(
        () => _i8.AuthInterceptor(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i361.Dio>(
        () => networkModule.dio(gh<_i8.AuthInterceptor>()));
    gh.lazySingleton<_i989.DashboardRemoteDataSource>(
        () => _i989.DashboardRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i557.DashboardRepository>(() =>
        _i448.DashboardRepositoryImpl(gh<_i989.DashboardRemoteDataSource>()));
    gh.lazySingleton<_i767.AuthRemoteDataSource>(
        () => _i767.AuthRemoteDataSourceImpl(
              gh<_i361.Dio>(),
              gh<_i558.FlutterSecureStorage>(),
            ));
    gh.lazySingleton<_i1015.AuthRepository>(() => _i111.AuthRepositoryImpl(
          gh<_i767.AuthRemoteDataSource>(),
          gh<_i558.FlutterSecureStorage>(),
        ));
    gh.lazySingleton<_i319.GetDashboardDataUseCase>(
        () => _i319.GetDashboardDataUseCase(gh<_i557.DashboardRepository>()));
    gh.factory<_i521.DashboardBloc>(
        () => _i521.DashboardBloc(gh<_i319.GetDashboardDataUseCase>()));
    gh.lazySingleton<_i206.LoginUseCase>(
        () => _i206.LoginUseCase(gh<_i1015.AuthRepository>()));
    gh.lazySingleton<_i363.AuthBloc>(() => _i363.AuthBloc(
          loginUseCase: gh<_i206.LoginUseCase>(),
          authRepository: gh<_i1015.AuthRepository>(),
        ));
    return this;
  }
}

class _$StorageModule extends _i884.StorageModule {}

class _$NetworkModule extends _i550.NetworkModule {}
