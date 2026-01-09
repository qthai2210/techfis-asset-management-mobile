import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/features/settings/data/datasources/language_local_data_source.dart';
import 'package:techfis_asset_management_mobile/features/settings/domain/repositories/language_repository.dart';

@LazySingleton(as: LanguageRepository)
class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageLocalDataSource _localDataSource;

  LanguageRepositoryImpl(this._localDataSource);

  @override
  Future<String> getLanguage() async {
    final languageCode = await _localDataSource.getLanguageCode();
    return languageCode ?? 'vi'; // Default to vietnamese as per main.dart
  }

  @override
  Future<void> setLanguage(String languageCode) async {
    await _localDataSource.cacheLanguageCode(languageCode);
  }
}
