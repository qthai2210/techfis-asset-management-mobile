import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:techfis_asset_management_mobile/core/constants/app_colors.dart';
import 'package:techfis_asset_management_mobile/core/presentation/widgets/shimmer_loading.dart';
import 'package:techfis_asset_management_mobile/core/presentation/widgets/app_state_display.dart';
import 'package:techfis_asset_management_mobile/injection_container.dart';
import 'package:techfis_asset_management_mobile/core/utils/error_translator.dart';
import 'package:techfis_asset_management_mobile/features/assets/domain/entities/asset.dart';
import 'package:techfis_asset_management_mobile/features/assets/presentation/bloc/asset_bloc.dart';
import 'package:techfis_asset_management_mobile/features/assets/presentation/bloc/asset_event.dart';
import 'package:techfis_asset_management_mobile/features/assets/presentation/bloc/asset_state.dart';

class AssetDetailPage extends StatelessWidget {
  final int assetId;

  const AssetDetailPage({super.key, required this.assetId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AssetBloc>()..add(GetAssetDetailEvent(assetId)),
      child: _AssetDetailView(assetId: assetId),
    );
  }
}

class _AssetDetailView extends StatelessWidget {
  final int assetId;
  const _AssetDetailView({required this.assetId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.assetDetails),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<AssetBloc, AssetState>(
        builder: (context, state) {
          if (state is AssetLoading) {
            return const ShimmerLoading(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    ShimmerPlaceholder(width: double.infinity, height: 100),
                    SizedBox(height: 24),
                    ShimmerPlaceholder(width: double.infinity, height: 200),
                    SizedBox(height: 24),
                    ShimmerPlaceholder(width: double.infinity, height: 150),
                  ],
                ),
              ),
            );
          } else if (state is AssetDetailLoaded) {
            final asset = state.asset;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(asset),
                  const SizedBox(height: 24),
                  _buildDetailsCard(asset, l10n),
                  const SizedBox(height: 24),
                  _buildLifecycleCard(asset, l10n),
                  const SizedBox(height: 32),
                ],
              ),
            );
          } else if (state is AssetError) {
            return AppStateDisplay.error(
              title: l10n.serverError,
              description: context.translateError(state.message),
              buttonLabel: l10n.retry,
              onButtonPressed: () {
                context.read<AssetBloc>().add(GetAssetDetailEvent(assetId));
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildHeader(Asset asset) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Hero(
            tag: 'asset_image_${asset.id}',
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Icon(
                Icons.inventory_2_outlined,
                size: 40,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  asset.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  asset.assetCode,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(height: 8),
                _buildStatusBadge(asset.status ?? 'Unknown'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    switch (status.toUpperCase()) {
      case 'ACTIVE':
      case 'USING':
        color = AppColors.success;
        break;
      case 'MAINTENANCE':
        color = AppColors.warning;
        break;
      case 'BROKEN':
        color = AppColors.error;
        break;
      default:
        color = AppColors.info;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDetailsCard(Asset asset, AppLocalizations l10n) {
    return _buildSectionCard(
      title: l10n.specifications,
      icon: Icons.info_outline,
      children: [
        _buildDetailRow(l10n.model, asset.model),
        _buildDetailRow(l10n.serial, asset.serial),
        _buildDetailRow(l10n.categoryId, asset.categoryId?.toString()),
        _buildDetailRow(l10n.locationId, asset.locationId?.toString()),
        _buildDetailRow(l10n.condition, asset.condition),
        _buildDetailPrice(l10n.purchasePrice, asset.purchasePrice),
      ],
    );
  }

  Widget _buildLifecycleCard(Asset asset, AppLocalizations l10n) {
    return _buildSectionCard(
      title: l10n.lifecycle,
      icon: Icons.history,
      children: [
        _buildDetailRow(l10n.purchasedDate, asset.purchaseDate),
        _buildDetailRow(l10n.warrantyEnd, asset.warrantyEnd),
      ],
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    if (value == null || value.isEmpty || value == 'null') {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  color: AppColors.textSecondary, fontSize: 14)),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailPrice(String label, double? price) {
    if (price == null) return const SizedBox.shrink();
    return _buildDetailRow(label, '${price.toStringAsFixed(0)} đ');
  }
}
