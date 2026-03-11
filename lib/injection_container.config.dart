// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:techfis_asset_management_mobile/core/network/auth_interceptor.dart'
    as _i623;
import 'package:techfis_asset_management_mobile/core/network/dio_client.dart'
    as _i420;
import 'package:techfis_asset_management_mobile/core/network/network_info.dart'
    as _i754;
import 'package:techfis_asset_management_mobile/core/network/network_module.dart'
    as _i504;
import 'package:techfis_asset_management_mobile/core/services/storage_module.dart'
    as _i108;
import 'package:techfis_asset_management_mobile/features/assets/data/datasources/asset_local_data_source.dart'
    as _i400;
import 'package:techfis_asset_management_mobile/features/assets/data/datasources/asset_remote_data_source.dart'
    as _i486;
import 'package:techfis_asset_management_mobile/features/assets/data/models/asset_model.dart'
    as _i849;
import 'package:techfis_asset_management_mobile/features/assets/data/repositories/asset_repository_impl.dart'
    as _i730;
import 'package:techfis_asset_management_mobile/features/assets/domain/repositories/asset_repository.dart'
    as _i644;
import 'package:techfis_asset_management_mobile/features/assets/domain/usecases/get_asset_detail.dart'
    as _i716;
import 'package:techfis_asset_management_mobile/features/assets/domain/usecases/get_assets.dart'
    as _i419;
import 'package:techfis_asset_management_mobile/features/assets/presentation/bloc/asset_bloc.dart'
    as _i520;
import 'package:techfis_asset_management_mobile/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i692;
import 'package:techfis_asset_management_mobile/features/auth/data/repositories/auth_repository_impl.dart'
    as _i250;
import 'package:techfis_asset_management_mobile/features/auth/domain/repositories/auth_repository.dart'
    as _i877;
import 'package:techfis_asset_management_mobile/features/auth/domain/usecases/login_usecase.dart'
    as _i98;
import 'package:techfis_asset_management_mobile/features/auth/presentation/bloc/auth_bloc.dart'
    as _i189;
import 'package:techfis_asset_management_mobile/features/dashboard/data/datasources/dashboard_remote_data_source.dart'
    as _i226;
import 'package:techfis_asset_management_mobile/features/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i15;
import 'package:techfis_asset_management_mobile/features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i1040;
import 'package:techfis_asset_management_mobile/features/dashboard/domain/usecases/get_dashboard_data_usecase.dart'
    as _i628;
import 'package:techfis_asset_management_mobile/features/dashboard/presentation/bloc/dashboard_bloc.dart'
    as _i960;
import 'package:techfis_asset_management_mobile/features/settings/data/datasources/language_local_data_source.dart'
    as _i901;
import 'package:techfis_asset_management_mobile/features/settings/data/datasources/theme_local_data_source.dart'
    as _i488;
import 'package:techfis_asset_management_mobile/features/settings/data/repositories/language_repository_impl.dart'
    as _i558;
import 'package:techfis_asset_management_mobile/features/settings/data/repositories/theme_repository_impl.dart'
    as _i670;
import 'package:techfis_asset_management_mobile/features/settings/domain/repositories/language_repository.dart'
    as _i871;
import 'package:techfis_asset_management_mobile/features/settings/domain/repositories/theme_repository.dart'
    as _i321;
import 'package:techfis_asset_management_mobile/features/settings/presentation/bloc/language_bloc.dart'
    as _i113;
import 'package:techfis_asset_management_mobile/features/settings/presentation/bloc/theme_bloc.dart'
    as _i410;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final storageModule = _$StorageModule();
    gh.factory<_i410.ThemeBloc>(() => _i410.ThemeBloc());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => networkModule.internetConnectionChecker);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => storageModule.secureStorage);
    gh.lazySingleton<_i488.ThemeLocalDataSource>(
        () => _i488.ThemeLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()));
    await gh.lazySingletonAsync<_i979.Box<_i849.AssetModel>>(
      () => networkModule.assetBox,
      instanceName: 'assetBox',
      preResolve: true,
    );
    gh.lazySingleton<_i400.AssetLocalDataSource>(() =>
        _i400.AssetLocalDataSourceImpl(
            gh<_i979.Box<_i849.AssetModel>>(instanceName: 'assetBox')));
    gh.lazySingleton<_i321.ThemeRepository>(
        () => _i670.ThemeRepositoryImpl(gh<_i488.ThemeLocalDataSource>()));
    gh.lazySingleton<_i901.LanguageLocalDataSource>(() =>
        _i901.LanguageLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i623.AuthInterceptor>(
        () => _i623.AuthInterceptor(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i754.NetworkInfo>(
        () => _i754.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
    gh.lazySingleton<_i871.LanguageRepository>(() =>
        _i558.LanguageRepositoryImpl(gh<_i901.LanguageLocalDataSource>()));
    gh.lazySingleton<_i420.DioClient>(
        () => _i420.DioClient(gh<_i623.AuthInterceptor>()));
    gh.lazySingleton<_i486.AssetRemoteDataSource>(
        () => _i486.AssetRemoteDataSourceImpl(gh<_i420.DioClient>()));
    gh.factory<_i113.LanguageBloc>(
        () => _i113.LanguageBloc(gh<_i871.LanguageRepository>()));
    gh.lazySingleton<_i226.DashboardRemoteDataSource>(
        () => _i226.DashboardRemoteDataSourceImpl(gh<_i420.DioClient>()));
    gh.lazySingleton<_i692.AuthRemoteDataSource>(
        () => _i692.AuthRemoteDataSourceImpl(
              gh<_i420.DioClient>(),
              gh<_i558.FlutterSecureStorage>(),
            ));
    gh.lazySingleton<_i644.AssetRepository>(() => _i730.AssetRepositoryImpl(
          gh<_i486.AssetRemoteDataSource>(),
          gh<_i400.AssetLocalDataSource>(),
          gh<_i754.NetworkInfo>(),
        ));
    gh.lazySingleton<_i1040.DashboardRepository>(() =>
        _i15.DashboardRepositoryImpl(gh<_i226.DashboardRemoteDataSource>()));
    gh.lazySingleton<_i877.AuthRepository>(() => _i250.AuthRepositoryImpl(
          gh<_i692.AuthRemoteDataSource>(),
          gh<_i558.FlutterSecureStorage>(),
        ));
    gh.lazySingleton<_i628.GetDashboardDataUseCase>(
        () => _i628.GetDashboardDataUseCase(gh<_i1040.DashboardRepository>()));
    gh.lazySingleton<_i419.GetAssets>(
        () => _i419.GetAssets(gh<_i644.AssetRepository>()));
    gh.lazySingleton<_i716.GetAssetDetail>(
        () => _i716.GetAssetDetail(gh<_i644.AssetRepository>()));
    gh.factory<_i520.AssetBloc>(() => _i520.AssetBloc(
          getAssets: gh<_i419.GetAssets>(),
          getAssetDetail: gh<_i716.GetAssetDetail>(),
        ));
    gh.factory<_i960.DashboardBloc>(
        () => _i960.DashboardBloc(gh<_i628.GetDashboardDataUseCase>()));
    gh.lazySingleton<_i98.LoginUseCase>(
        () => _i98.LoginUseCase(gh<_i877.AuthRepository>()));
    gh.lazySingleton<_i189.AuthBloc>(() => _i189.AuthBloc(
          loginUseCase: gh<_i98.LoginUseCase>(),
          authRepository: gh<_i877.AuthRepository>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i504.NetworkModule {}

class _$StorageModule extends _i108.StorageModule {}
