import 'package:flutter/material.dart';

class AQICard extends StatelessWidget {
  final int aqi;
  final String level;

  const AQICard({super.key, required this.aqi, required this.level});

  Color _getAQIColor(int aqi) {
    if (aqi <= 50) return Colors.green;
    if (aqi <= 100) return Colors.yellow;
    if (aqi <= 200) return Colors.orange;
    if (aqi <= 300) return Colors.red;
    if (aqi <= 400) return Colors.purple;
    return Colors.brown;
  }

  @override
  Widget build(BuildContext context) {
    final color = _getAQIColor(aqi);

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        children: [
          const Text("Current AQI", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Text(
            "$aqi",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(level, style: TextStyle(fontSize: 20, color: color)),
        ],
      ),
    );
  }
}
