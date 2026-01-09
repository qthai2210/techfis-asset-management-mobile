import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/features/settings/data/datasources/theme_local_data_source.dart';
import 'package:techfis_asset_management_mobile/features/settings/domain/repositories/theme_repository.dart';

@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource _localDataSource;

  ThemeRepositoryImpl(this._localDataSource);

  @override
  Future<ThemeMode> getThemeMode() async {
    return await _localDataSource.getThemeMode();
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    await _localDataSource.cacheThemeMode(mode);
  }
}
