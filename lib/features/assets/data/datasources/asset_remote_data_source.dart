import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/core/error/exceptions.dart';
import 'package:techfis_asset_management_mobile/core/constants/api_constants.dart';
import 'package:techfis_asset_management_mobile/core/network/models/base_response.dart';
import 'package:techfis_asset_management_mobile/core/network/models/paginated_data.dart';
import 'package:techfis_asset_management_mobile/features/assets/data/models/asset_model.dart';

abstract class AssetRemoteDataSource {
  Future<List<AssetModel>> getAssets({
    int? page,
    int? limit,
    String? search,
    String? status,
    int? categoryId,
  });
  Future<AssetModel> getAssetDetail(int id);
}

@LazySingleton(as: AssetRemoteDataSource)
class AssetRemoteDataSourceImpl implements AssetRemoteDataSource {
  final Dio client;

  AssetRemoteDataSourceImpl(this.client);

  @override
  Future<List<AssetModel>> getAssets({
    int? page,
    int? limit,
    String? search,
    String? status,
    int? categoryId,
  }) async {
    try {
      final response = await client.get(
        ApiConstants.assets,
        queryParameters: {
          if (page != null) 'page': page,
          if (limit != null) 'limit': limit,
          if (search != null) 'search': search,
          if (status != null) 'status': status,
          if (categoryId != null) 'category_id': categoryId,
        },
      );

      final baseResponse = BaseResponse<PaginatedData<AssetModel>>.fromJson(
        response.data,
        (json) => PaginatedData<AssetModel>.fromJson(
          json as Map<String, dynamic>,
          (json) => AssetModel.fromJson(json as Map<String, dynamic>),
        ),
      );

      if (baseResponse.success && baseResponse.data != null) {
        return baseResponse.data!.data;
      } else {
        throw ServerException(message: baseResponse.message);
      }
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['message'] ?? 'Failed to load assets',
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<AssetModel> getAssetDetail(int id) async {
    try {
      final response =
          await client.get(ApiConstants.assetDetail(id.toString()));

      final baseResponse = BaseResponse<AssetModel>.fromJson(
        response.data,
        (json) => AssetModel.fromJson(json as Map<String, dynamic>),
      );

      if (baseResponse.success && baseResponse.data != null) {
        return baseResponse.data!;
      } else {
        throw ServerException(message: baseResponse.message);
      }
    } on DioException catch (e) {
      throw ServerException(
        message: e.response?.data['message'] ?? 'Failed to load asset details',
      );
    }
  }
}
