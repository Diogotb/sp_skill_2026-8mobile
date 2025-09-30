import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DailyStepsChart extends StatelessWidget {
  final double stepsTarget;
  final List<double> dailySteps;

  final List<String> weekDays;

  const DailyStepsChart({
    super.key,
    required this.stepsTarget,
    required this.dailySteps,
    this.weekDays = const ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom'],
  });

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
                      space: 4,
                      child: Text(
                        weekDays[value.toInt()],
                        style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 12),
                      ),
                    );
                  },
                  reservedSize: 20,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value == 0 || value % 1000 == 0) {
                      return SideTitleWidget(
                        meta: meta,
                        space: 4,
                        child: Text(
                          '${value.toInt()}',
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 12),
                        ),
                      );
                    }
                    return Container();
                  },
                  reservedSize: 32,
                ),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 5000,
              getDrawingHorizontalLine: (value) =>
                  FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 0.8),
            ),
            borderData: FlBorderData(show: false),
            barGroups: _buildBarGroups(context),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(BuildContext context) {
    return List.generate(dailySteps.length, (index) {
      final stepsAchieved = dailySteps[index];

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
