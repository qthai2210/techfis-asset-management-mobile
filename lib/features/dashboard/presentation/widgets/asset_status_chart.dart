import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/theme.dart';
import '../../domain/entities/dashboard.dart';

class AssetStatusChart extends StatefulWidget {
  final List<AssetStatusReport> data;

  const AssetStatusChart({super.key, required this.data});

  @override
  State<AssetStatusChart> createState() => _AssetStatusChartState();
}

class _AssetStatusChartState extends State<AssetStatusChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) {
      return const Center(child: Text('No data'));
    }

    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(show: false),
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: showingSections(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Legend
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: widget.data.map((item) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getColor(item.status),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Text('${item.status}: ${item.count}'),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(widget.data.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      final item = widget.data[i];
      final color = _getColor(item.status);

      return PieChartSectionData(
        color: color,
        value: item.count.toDouble(),
        title: '${item.percentage.toStringAsFixed(1)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: const [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      );
    });
  }

  Color _getColor(String status) {
    switch (status) {
      case 'ACTIVE':
        return Colors.green;
      case 'INACTIVE':
        return Colors.grey;
      case 'DISPOSED':
        return Colors.red;
      case 'UNDER_MAINTENANCE':
        return Colors.orange;
      default:
        return AppTheme.primaryColor;
    }
  }
}
