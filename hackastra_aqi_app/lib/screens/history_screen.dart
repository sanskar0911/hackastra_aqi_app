import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historical AQI Data')),
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 20),
            Text("AQI History", style: TextStyle(fontSize: 20)),
            SizedBox(height: 30),
            Placeholder(fallbackHeight: 250), // Replace with line chart
            SizedBox(height: 20),
            Text("Daily AQI over time", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
