import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:techfis_asset_management_mobile/core/error/failures.dart';
import 'package:techfis_asset_management_mobile/core/usecases/usecase.dart';
import 'package:techfis_asset_management_mobile/features/assets/domain/entities/asset.dart';
import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/features/assets/domain/repositories/asset_repository.dart';

@lazySingleton
class GetAssetDetail implements UseCase<Asset, GetAssetDetailParams> {
  final AssetRepository repository;

  GetAssetDetail(this.repository);

  @override
  Future<Either<Failure, Asset>> call(GetAssetDetailParams params) async {
    return await repository.getAssetDetail(params.id);
  }
}

class GetAssetDetailParams extends Equatable {
  final int id;

  const GetAssetDetailParams({required this.id});

  @override
  List<Object?> get props => [id];
}
