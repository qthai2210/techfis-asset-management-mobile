import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/core/constants/app_constants.dart';
import 'package:techfis_asset_management_mobile/core/utils/failure_mapper.dart';
import 'package:techfis_asset_management_mobile/features/assets/domain/entities/asset.dart';
import 'package:techfis_asset_management_mobile/features/assets/domain/usecases/get_asset_detail.dart';
import 'package:techfis_asset_management_mobile/features/assets/domain/usecases/get_assets.dart';
import 'package:techfis_asset_management_mobile/features/assets/presentation/bloc/asset_event.dart';
import 'package:techfis_asset_management_mobile/features/assets/presentation/bloc/asset_state.dart';

@injectable
class AssetBloc extends Bloc<AssetEvent, AssetState> {
  final GetAssets getAssets;
  final GetAssetDetail getAssetDetail;

  AssetBloc({
    required this.getAssets,
    required this.getAssetDetail,
  }) : super(AssetInitial()) {
    on<GetAssetsEvent>(_onGetAssets);
    on<GetAssetDetailEvent>(_onGetAssetDetail);
  }

  Future<void> _onGetAssets(
    GetAssetsEvent event,
    Emitter<AssetState> emit,
  ) async {
    final currentState = state;
    var currentAssets = <Asset>[];
    var page = event.page ?? 1;

    if (event.isLoadMore && currentState is AssetsLoaded) {
      if (currentState.hasReachedMax) return;
      currentAssets = currentState.assets;
      page = currentState.currentPage + 1;
    } else {
      emit(AssetLoading());
    }

    final result = await getAssets(GetAssetsParams(
      page: page,
      limit: event.limit ?? AppConstants.defaultPageSize,
      search: event.search,
      status: event.status,
      categoryId: event.categoryId,
    ));

    result.fold(
      (failure) => emit(AssetError(FailureMapper.mapFailureToMessage(failure))),
      (newAssets) {
        final isMax = newAssets.isEmpty ||
            newAssets.length < (event.limit ?? AppConstants.defaultPageSize);
        emit(AssetsLoaded(
          assets: page == 1 ? newAssets : currentAssets + newAssets,
          hasReachedMax: isMax,
          currentPage: page,
        ));
      },
    );
  }

  Future<void> _onGetAssetDetail(
    GetAssetDetailEvent event,
    Emitter<AssetState> emit,
  ) async {
    emit(AssetLoading());
    final result = await getAssetDetail(GetAssetDetailParams(id: event.id));
    result.fold(
      (failure) => emit(AssetError(FailureMapper.mapFailureToMessage(failure))),
      (asset) => emit(AssetDetailLoaded(asset)),
    );
  }
}
