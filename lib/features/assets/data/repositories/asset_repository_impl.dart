import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/core/error/failures.dart';
import 'package:techfis_asset_management_mobile/features/assets/domain/entities/asset.dart';
import 'package:techfis_asset_management_mobile/features/assets/domain/repositories/asset_repository.dart';
import 'package:techfis_asset_management_mobile/features/assets/data/datasources/asset_remote_data_source.dart';
import 'package:techfis_asset_management_mobile/features/assets/data/datasources/asset_local_data_source.dart';
import 'package:techfis_asset_management_mobile/core/network/network_info.dart';
import 'package:techfis_asset_management_mobile/core/error/error_handler.dart';

@LazySingleton(as: AssetRepository)
class AssetRepositoryImpl with ErrorHandler implements AssetRepository {
  final AssetRemoteDataSource _remoteDataSource;
  final AssetLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  AssetRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<Asset>>> getAssets({
    int? page,
    int? limit,
    String? search,
    String? status,
    int? categoryId,
  }) async {
    if (await _networkInfo.isConnected) {
      return handleRepositoryCall(() async {
        final remoteAssets = await _remoteDataSource.getAssets(
          page: page,
          limit: limit,
          search: search,
          status: status,
          categoryId: categoryId,
        );

        final isMainList = (page == null || page == 1) &&
            (search == null || search.isEmpty) &&
            (categoryId == null);

        if (isMainList) {
          await _localDataSource.cacheAssets(remoteAssets);
        }

        return remoteAssets;
      });
    } else {
      try {
        var localAssets = await _localDataSource.getLastAssets();

        // Apply Search
        if (search != null && search.isNotEmpty) {
          localAssets = localAssets
              .where((asset) =>
                  asset.name.toLowerCase().contains(search.toLowerCase()) ||
                  (asset.assetCode
                      .toLowerCase()
                      .contains(search.toLowerCase())))
              .toList();
        }

        // Apply Status Filter
        if (status != null && status.isNotEmpty) {
          localAssets = localAssets
              .where((asset) =>
                  asset.status?.toUpperCase() == status.toUpperCase())
              .toList();
        }

        // Apply Category Filter
        if (categoryId != null) {
          // localAssets = localAssets.where((asset) => asset.categoryId == categoryId).toList();
        }

        // Apply Pagination
        if (page != null && limit != null) {
          final startIndex = (page - 1) * limit;
          if (startIndex >= localAssets.length) {
            return const Right([]);
          }
          final endIndex = (startIndex + limit) < localAssets.length
              ? (startIndex + limit)
              : localAssets.length;
          localAssets = localAssets.sublist(startIndex, endIndex);
        }

        return Right(localAssets);
      } catch (e) {
        return const Left(CacheFailure('failedToLoadAssets'));
      }
    }
  }

  @override
  Future<Either<Failure, Asset>> getAssetDetail(int id) async {
    if (await _networkInfo.isConnected) {
      return handleRepositoryCall(() => _remoteDataSource.getAssetDetail(id));
    } else {
      try {
        final localAssets = await _localDataSource.getLastAssets();
        final asset = localAssets.firstWhere((element) => element.id == id);
        return Right(asset);
      } catch (e) {
        return const Left(CacheFailure('failedToLoadAssetDetails'));
      }
    }
  }
}
