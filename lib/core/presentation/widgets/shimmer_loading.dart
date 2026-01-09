import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:techfis_asset_management_mobile/core/constants/app_colors.dart';

class ShimmerLoading extends StatelessWidget {
  final Widget child;
  const ShimmerLoading({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: child,
    );
  }
}

class ShimmerPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;

  const ShimmerPlaceholder({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

/// A specific shimmer layout for the Dashboard Stats
class DashboardStatShimmer extends StatelessWidget {
  const DashboardStatShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        4,
        (index) => const Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerPlaceholder(width: 40, height: 40),
                SizedBox(height: 12),
                ShimmerPlaceholder(width: 80, height: 20),
                SizedBox(height: 8),
                ShimmerPlaceholder(width: 100, height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A specific shimmer layout for the Dashboard Charts
class DashboardChartShimmer extends StatelessWidget {
  const DashboardChartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerPlaceholder(
            width: 150, height: 24, margin: EdgeInsets.only(bottom: 16)),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 200,
            ),
          ),
        ),
      ],
    );
  }
}

/// A list item shimmer for the Asset List
class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, __) => const Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              ShimmerPlaceholder(width: 80, height: 80, borderRadius: 8),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerPlaceholder(width: 150, height: 18),
                    SizedBox(height: 8),
                    ShimmerPlaceholder(width: 100, height: 14),
                    SizedBox(height: 8),
                    ShimmerPlaceholder(width: 120, height: 14),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
