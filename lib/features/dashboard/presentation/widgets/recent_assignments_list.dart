import 'package:flutter/material.dart';
import '../../domain/entities/dashboard.dart';

class RecentAssignmentsList extends StatelessWidget {
  final List<AssignmentReport> assignments;

  const RecentAssignmentsList({super.key, required this.assignments});

  @override
  Widget build(BuildContext context) {
    if (assignments.isEmpty) {
      return const Center(child: Text('No recent assignments'));
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: assignments.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final item = assignments[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(item.assetName,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('To: ${item.assignedTo}\nCode: ${item.assetCode}'),
          trailing: _buildStatusChip(item.status),
          isThreeLine: true,
        );
      },
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status) {
      case 'ACCEPTED':
        color = Colors.green;
        break;
      case 'PENDING':
        color = Colors.orange;
        break;
      case 'REJECTED':
        color = Colors.red;
        break;
      default:
        color = Colors.blue;
    }

    return Chip(
      label: Text(
        status,
        style: const TextStyle(fontSize: 10, color: Colors.white),
      ),
      backgroundColor: color,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
    );
  }
}
