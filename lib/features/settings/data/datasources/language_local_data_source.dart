import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LanguageLocalDataSource {
  Future<String?> getLanguageCode();
  Future<void> cacheLanguageCode(String languageCode);
}

@LazySingleton(as: LanguageLocalDataSource)
class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  final FlutterSecureStorage _secureStorage;
  static const _languageKey = 'cached_language_code';

  LanguageLocalDataSourceImpl(this._secureStorage);

  @override
  Future<String?> getLanguageCode() async {
    return await _secureStorage.read(key: _languageKey);
  }

  @override
  Future<void> cacheLanguageCode(String languageCode) async {
    await _secureStorage.write(key: _languageKey, value: languageCode);
  }
}
