import 'package:flutter/material.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/domain/entities/dashboard.dart';

class AssetStatusChart extends StatelessWidget {
  final List<AssetStatusReport> data;

  const AssetStatusChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Icon(Icons.pie_chart_outline, size: 48, color: Colors.grey),
          const SizedBox(height: 8),
          const Text(
            'Chart Component Disabled',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            'Processed ${data.length} status categories',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
