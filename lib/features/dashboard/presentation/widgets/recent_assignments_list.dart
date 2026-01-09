import 'package:flutter/material.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/domain/entities/dashboard.dart';
import 'package:techfis_asset_management_mobile/core/constants/app_colors.dart';
import 'package:techfis_asset_management_mobile/core/presentation/widgets/app_state_display.dart';

class RecentAssignmentsList extends StatelessWidget {
  final List<AssignmentReport> assignments;

  const RecentAssignmentsList({super.key, required this.assignments});

  @override
  Widget build(BuildContext context) {
    if (assignments.isEmpty) {
      return AppStateDisplay.empty(
        title: 'No Assignments',
        description: 'There are no recent assignments to display.',
        customIcon: Icons.assignment_outlined,
      );
    }

    return Column(
      children: [
        ...assignments.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(item.assetName,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle:
                    Text('To: ${item.assignedTo}\nCode: ${item.assetCode}'),
                trailing: _buildStatusChip(context, item.status),
                isThreeLine: true,
              ),
              if (index < assignments.length - 1) const Divider(),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildStatusChip(BuildContext context, String status) {
    Color color;
    switch (status.toUpperCase()) {
      case 'ACCEPTED':
        color = AppColors.success;
        break;
      case 'PENDING':
        color = AppColors.warning;
        break;
      case 'REJECTED':
        color = AppColors.error;
        break;
      default:
        color = AppColors.info;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Text(
        status,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
