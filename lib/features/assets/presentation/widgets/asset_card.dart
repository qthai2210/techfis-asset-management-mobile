import 'package:flutter/material.dart';
import 'package:techfis_asset_management_mobile/core/constants/app_colors.dart';
import 'package:techfis_asset_management_mobile/core/presentation/widgets/app_image.dart';
import 'package:techfis_asset_management_mobile/features/assets/domain/entities/asset.dart';

class AssetCard extends StatelessWidget {
  final Asset asset;
  final VoidCallback onTap;

  const AssetCard({
    super.key,
    required this.asset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.divider.withValues(alpha: 0.5)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Asset Image Placeholder with Hero
              Hero(
                tag: 'asset_image_${asset.id}',
                child: AppImage(
                  imageUrl: asset.imageUrl ?? '',
                  width: 70,
                  height: 70,
                  borderRadius: 12,
                  errorWidget: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.textPrimary.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.inventory_2_outlined,
                      color: AppColors.primary,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Asset Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      asset.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Code: ${asset.assetCode}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    _buildStatusBadge(context, asset.status ?? 'Unknown'),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, String status) {
    Color color;
    switch (status.toUpperCase()) {
      case 'ACTIVE':
      case 'USING':
        color = AppColors.success;
        break;
      case 'MAINTENANCE':
      case 'UNDER_MAINTENANCE':
        color = AppColors.warning;
        break;
      case 'BROKEN':
        color = AppColors.error;
        break;
      case 'DISPOSED':
      case 'LIQUIDATED':
        color = AppColors.disposed;
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
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
      ),
    );
  }
}
