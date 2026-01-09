import 'package:equatable/equatable.dart';

abstract class AssetEvent extends Equatable {
  const AssetEvent();

  @override
  List<Object?> get props => [];
}

class GetAssetsEvent extends AssetEvent {
  final int? page;
  final int? limit;
  final String? search;
  final String? status;
  final int? categoryId;
  final bool isLoadMore;

  const GetAssetsEvent({
    this.page,
    this.limit,
    this.search,
    this.status,
    this.categoryId,
    this.isLoadMore = false,
  });

  @override
  List<Object?> get props =>
      [page, limit, search, status, categoryId, isLoadMore];
}

class GetAssetDetailEvent extends AssetEvent {
  final int id;

  const GetAssetDetailEvent(this.id);

  @override
  List<Object?> get props => [id];
}
