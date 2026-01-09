import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class ThemeLocalDataSource {
  Future<ThemeMode> getThemeMode();
  Future<void> cacheThemeMode(ThemeMode mode);
}

@LazySingleton(as: ThemeLocalDataSource)
class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  final FlutterSecureStorage _secureStorage;
  static const _themeKey = 'cached_theme_mode';

  ThemeLocalDataSourceImpl(this._secureStorage);

  @override
  Future<ThemeMode> getThemeMode() async {
    final mode = await _secureStorage.read(key: _themeKey);
    if (mode == 'dark') return ThemeMode.dark;
    if (mode == 'light') return ThemeMode.light;
    return ThemeMode.system;
  }

  @override
  Future<void> cacheThemeMode(ThemeMode mode) async {
    await _secureStorage.write(key: _themeKey, value: mode.name);
  }
}
