import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DoughnutChartData {
  final String label;
  final double value;
  final Color color;

  DoughnutChartData(this.label, this.value, this.color);
}

class DoughnutChartWidget extends StatelessWidget {
  final List<DoughnutChartData> data;
  final String centerText;
  final String centerLabel;

  const DoughnutChartWidget({
    super.key,
    required this.data,
    required this.centerText,
    required this.centerLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Fixed height for consistency
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 60,
              sections: data.map((item) {
                return PieChartSectionData(
                  color: item.color,
                  value: item.value,
                  title: '', // Hide title on sections
                  radius: 12, // Thin ring
                  showTitle: false,
                );
              }).toList(),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  centerText,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  centerLabel,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
