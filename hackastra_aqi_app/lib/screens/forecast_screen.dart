import 'package:flutter/material.dart';
// ignore: unused_import
import '../components/forecast_chart.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('72-Hour AQI Forecast')),
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 20),
            Text("Predicted AQI Levels", style: TextStyle(fontSize: 20)),
            SizedBox(height: 30),
            ForecastChart(
              forecastData: [
                150,
                160,
                170,
                180,
                200,
                190,
                180,
                170,
                160,
                150,
              ], // sample data
            ),
            // Replace with chart later
            SizedBox(height: 20),
            Text(
              "Green = Safe | Red = Hazardous",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
