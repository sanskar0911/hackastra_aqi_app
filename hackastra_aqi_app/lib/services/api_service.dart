import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Update this to match your IP + Flask port
  static const String baseUrl = 'http://192.168.29.215:5000';

  static Future<Map<String, dynamic>> fetchAQI(double lat, double lon) async {
    final url = Uri.parse('$baseUrl/aqi?lat=$lat&lon=$lon');
    print('🔄 Requesting: $url');

    final response = await http.get(url);
    print('🔁 Response: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return {'aqi': data['aqi'], 'level': data['level']};
    } else {
      throw Exception('Failed to fetch AQI');
    }
  }

  static Future<List<double>> fetchForecast() async {
    final url = Uri.parse('$baseUrl/forecast');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<double>.from(
        data['forecast'].map((val) => (val as num).toDouble()),
      );
    } else {
      throw Exception('Failed to fetch forecast');
    }
  }
}
