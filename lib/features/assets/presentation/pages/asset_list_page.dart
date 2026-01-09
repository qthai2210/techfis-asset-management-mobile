import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:techfis_asset_management_mobile/injection_container.dart';
import 'package:techfis_asset_management_mobile/features/assets/presentation/bloc/asset_bloc.dart';
import 'package:techfis_asset_management_mobile/features/assets/presentation/bloc/asset_event.dart';
import 'package:techfis_asset_management_mobile/features/assets/presentation/bloc/asset_state.dart';
import 'package:techfis_asset_management_mobile/features/assets/presentation/widgets/asset_card.dart';
import 'package:techfis_asset_management_mobile/core/presentation/widgets/app_drawer.dart';
import 'package:techfis_asset_management_mobile/core/presentation/widgets/shimmer_loading.dart';

import 'package:techfis_asset_management_mobile/core/presentation/widgets/app_state_display.dart';

import 'package:techfis_asset_management_mobile/core/utils/error_translator.dart';

class AssetListPage extends StatelessWidget {
  const AssetListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AssetBloc>()..add(const GetAssetsEvent()),
      child: const _AssetListView(),
    );
  }
}

class _AssetListView extends StatefulWidget {
  const _AssetListView();

  @override
  State<_AssetListView> createState() => _AssetListViewState();
}

class _AssetListViewState extends State<_AssetListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<AssetBloc>().add(const GetAssetsEvent(isLoadMore: true));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(l10n.assets),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: l10n.search,
            onPressed: () {
              // TODO: Implement search
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: l10n.filter,
            onPressed: () {
              // TODO: Implement filter
            },
          ),
        ],
      ),
      body: BlocBuilder<AssetBloc, AssetState>(
        builder: (context, state) {
          if (state is AssetLoading) {
            return const ShimmerLoading(child: ListTileShimmer());
          } else if (state is AssetsLoaded) {
            if (state.assets.isEmpty) {
              return AppStateDisplay.empty(
                title: l10n.noAssetsFound,
                description: 'Try adjusting your filters or search criteria.',
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                context.read<AssetBloc>().add(const GetAssetsEvent());
              },
              child: ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: state.hasReachedMax
                    ? state.assets.length
                    : state.assets.length + 1,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  if (index >= state.assets.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    );
                  }
                  final asset = state.assets[index];
                  return AssetCard(
                    asset: asset,
                    onTap: () {
                      context.push('/assets/detail', extra: asset.id);
                    },
                  );
                },
              ),
            );
          } else if (state is AssetError) {
            return AppStateDisplay.error(
              title: 'Load Failed',
              description: context.translateError(state.message),
              buttonLabel: l10n.retry,
              onButtonPressed: () {
                context.read<AssetBloc>().add(const GetAssetsEvent());
              },
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to Create Asset
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
