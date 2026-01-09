import 'package:equatable/equatable.dart';
import 'package:techfis_asset_management_mobile/features/assets/domain/entities/asset.dart';

abstract class AssetState extends Equatable {
  const AssetState();

  @override
  List<Object?> get props => [];
}

class AssetInitial extends AssetState {}

class AssetLoading extends AssetState {}

class AssetsLoaded extends AssetState {
  final List<Asset> assets;
  final bool hasReachedMax;
  final int currentPage;

  const AssetsLoaded({
    required this.assets,
    this.hasReachedMax = false,
    this.currentPage = 1,
  });

  AssetsLoaded copyWith({
    List<Asset>? assets,
    bool? hasReachedMax,
    int? currentPage,
  }) {
    return AssetsLoaded(
      assets: assets ?? this.assets,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [assets, hasReachedMax, currentPage];
}

class AssetDetailLoaded extends AssetState {
  final Asset asset;

  const AssetDetailLoaded(this.asset);

  @override
  List<Object?> get props => [asset];
}

class AssetError extends AssetState {
  final String message;

  const AssetError(this.message);

  @override
  List<Object?> get props => [message];
}
