import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/forecast_screen.dart';
import 'screens/heatmap_screen.dart';
import 'screens/history_screen.dart';

void main() {
  runApp(const HackastraApp());
}

class HackastraApp extends StatelessWidget {
  const HackastraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackastra AQI App',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/forecast': (context) => const ForecastScreen(),
        '/heatmap': (context) => const HeatmapScreen(),
        '/history': (context) => const HistoryScreen(),
      },
    );
  }
}
