import 'package:flutter/material.dart';
import '../components/aqi_card.dart';
import '../services/api_service.dart';
import '../services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int aqi = 0;
  String level = 'Loading...';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadAQI();
  }

  Future<void> loadAQI() async {
    try {
      final result = await ApiService.fetchAQI(
        19.03,
        73.02,
      ); // Replace with user lat/lon later
      setState(() {
        aqi = result['aqi'];
        level = result['level'];
        isLoading = false;
      });
      NotificationService.showAQIWarning(aqi);
    } catch (e) {
      setState(() {
        level = 'Error loading AQI';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hackastra AQI Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  AQICard(aqi: aqi, level: level),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forecast');
                    },
                    child: const Text('View Forecast'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/heatmap');
                    },
                    child: const Text('View Heatmap'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/history');
                    },
                    child: const Text('View History'),
                  ),
                ],
              ),
      ),
    );
  }
}
