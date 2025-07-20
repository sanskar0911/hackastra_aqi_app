import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HeatmapWidget extends StatefulWidget {
  const HeatmapWidget({super.key});

  @override
  State<HeatmapWidget> createState() => _HeatmapWidgetState();
}

class _HeatmapWidgetState extends State<HeatmapWidget> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(19.0760, 72.8777); // Mumbai

  final List<Circle> _circles = [
    Circle(
      circleId: CircleId('1'),
      center: LatLng(19.0760, 72.8777),
      radius: 3000,
      fillColor: Colors.red.withOpacity(0.4),
      strokeColor: Colors.red,
      strokeWidth: 1,
    ),
    Circle(
      circleId: CircleId('2'),
      center: LatLng(19.2183, 72.9781), // Navi Mumbai
      radius: 3000,
      fillColor: Colors.orange.withOpacity(0.4),
      strokeColor: Colors.orange,
      strokeWidth: 1,
    ),
    Circle(
      circleId: CircleId('3'),
      center: LatLng(19.0330, 73.0297), // Panvel
      radius: 3000,
      fillColor: Colors.green.withOpacity(0.4),
      strokeColor: Colors.green,
      strokeWidth: 1,
    ),
  ];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: _center, zoom: 10.5),
      circles: Set.from(_circles),
      myLocationEnabled: true,
    );
  }
}
