import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:techfis_asset_management_mobile/core/error/failures.dart';
import 'package:techfis_asset_management_mobile/core/usecases/usecase.dart';
import 'package:techfis_asset_management_mobile/features/assets/domain/entities/asset.dart';
import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/features/assets/domain/repositories/asset_repository.dart';

@lazySingleton
class GetAssets implements UseCase<List<Asset>, GetAssetsParams> {
  final AssetRepository repository;

  GetAssets(this.repository);

  @override
  Future<Either<Failure, List<Asset>>> call(GetAssetsParams params) async {
    return await repository.getAssets(
      page: params.page,
      limit: params.limit,
      search: params.search,
      status: params.status,
      categoryId: params.categoryId,
    );
  }
}

class GetAssetsParams extends Equatable {
  final int? page;
  final int? limit;
  final String? search;
  final String? status;
  final int? categoryId;

  const GetAssetsParams({
    this.page,
    this.limit,
    this.search,
    this.status,
    this.categoryId,
  });

  @override
  List<Object?> get props => [page, limit, search, status, categoryId];
}
