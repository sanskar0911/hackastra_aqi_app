import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ForecastChart extends StatelessWidget {
  final List<double> forecastData;

  const ForecastChart({super.key, required this.forecastData});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 40),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, _) {
                  final hour = value.toInt() * 3; // every 3 hours
                  return Text("$hour h", style: TextStyle(fontSize: 10));
                },
                interval: 1,
              ),
            ),
          ),
          minX: 0,
          maxX: forecastData.length.toDouble() - 1,
          minY: 0,
          maxY: 500,
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(forecastData.length, (i) {
                return FlSpot(i.toDouble(), forecastData[i]);
              }),
              isCurved: true,
              color: Colors.teal,
              barWidth: 3,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
