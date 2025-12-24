import 'package:fl_chart/fl_chart.dart';

LineChartData buildLineChart(List<double> values) {
  return LineChartData(
    minX: 0,
    maxX: values.length.toDouble(),
    minY: 0,
    maxY: values.reduce((a, b) => a > b ? a : b),
    lineBarsData: [
      LineChartBarData(
        spots: [
          for (int i = 0; i < values.length; i++)
            FlSpot(i.toDouble(), values[i])
        ],
      ),
    ],
  );
}
