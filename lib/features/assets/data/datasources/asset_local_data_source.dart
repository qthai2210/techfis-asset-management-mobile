import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/features/assets/data/models/asset_model.dart';

abstract class AssetLocalDataSource {
  Future<List<AssetModel>> getLastAssets();
  Future<void> cacheAssets(List<AssetModel> assetsToCache);
}

@LazySingleton(as: AssetLocalDataSource)
class AssetLocalDataSourceImpl implements AssetLocalDataSource {
  final Box<AssetModel> assetBox;

  AssetLocalDataSourceImpl(@Named('assetBox') this.assetBox);

  @override
  Future<List<AssetModel>> getLastAssets() async {
    return assetBox.values.toList();
  }

  @override
  Future<void> cacheAssets(List<AssetModel> assetsToCache) async {
    await assetBox.clear();
    await assetBox.addAll(assetsToCache);
  }
}
