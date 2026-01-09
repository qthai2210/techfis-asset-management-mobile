import 'package:dartz/dartz.dart';
import 'package:techfis_asset_management_mobile/core/error/failures.dart';
import 'package:techfis_asset_management_mobile/features/assets/domain/entities/asset.dart';

abstract class AssetRepository {
  Future<Either<Failure, List<Asset>>> getAssets({
    int? page,
    int? limit,
    String? search,
    String? status,
    int? categoryId,
  });
  Future<Either<Failure, Asset>> getAssetDetail(int id);
}
