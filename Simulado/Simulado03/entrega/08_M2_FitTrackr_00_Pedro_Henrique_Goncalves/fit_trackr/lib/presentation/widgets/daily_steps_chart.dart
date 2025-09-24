import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DailyStepsChart extends StatelessWidget {
  const DailyStepsChart({super.key});

  final double stepsTarget = 15000;
  final List<Map<String, double>> dailyData = const [
    {'stepsAchieved': 10000}, // Seg
    {'stepsAchieved': 8000},  // Ter
    {'stepsAchieved': 12500}, // Qua
    {'stepsAchieved': 9000},  // Qui
    {'stepsAchieved': 10500}, // Sex
    {'stepsAchieved': 12000}, // Sab
    {'stepsAchieved': 5500},  // Dom
  ];

  final List<String> weekDays = const ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: AspectRatio(
        aspectRatio: 1.7,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: stepsTarget,
            barTouchData: BarTouchData(enabled: false),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return SideTitleWidget(
                      meta: meta,
                      space: 8,
                      child: Text(weekDays[value.toInt()], style: const TextStyle(color: Colors.black, fontSize: 12)),
                    );
                  },
                  reservedSize: 20,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value == 0 || value % 5000 == 0) {
                      return SideTitleWidget(
                        meta: meta,
                        space: 8,
                        child: Text('${value.toInt()}', style: const TextStyle(color: Colors.black, fontSize: 10)),
                      );
                    }
                    return Container();
                  },
                  reservedSize: 30,
                ),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 5000,
              getDrawingHorizontalLine: (value) => FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 0.8),
            ),
            borderData: FlBorderData(show: false),
            barGroups: _buildBarGroups(context),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(BuildContext context) {
    return List.generate(dailyData.length, (index) {
      final stepsAchieved = dailyData[index]['stepsAchieved']!;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: stepsTarget,
            width: 15,
            borderRadius: BorderRadius.zero,
            rodStackItems: [
              BarChartRodStackItem(
                0,
                stepsAchieved,
                Theme.of(context).colorScheme.secondary,
              ),
              BarChartRodStackItem(
                stepsAchieved,
                stepsTarget,
                Colors.grey.withOpacity(0.4),
              ),
            ],
          ),
        ],
      );
    });
  }
}