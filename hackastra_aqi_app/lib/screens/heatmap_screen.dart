import 'package:flutter/material.dart';

class HeatmapScreen extends StatelessWidget {
  const HeatmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AQI Heatmap')),
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 20),
            Text("Heatmap of AQI Levels", style: TextStyle(fontSize: 20)),
            SizedBox(height: 30),
            Placeholder(fallbackHeight: 300), // Replace with Google Map later
            SizedBox(height: 20),
            Text("Color coded by AQI", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
