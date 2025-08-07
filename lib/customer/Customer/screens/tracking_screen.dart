
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  late GoogleMapController _mapController;

  // Mock caregiver coordinates (change to live data later)
  final LatLng caregiverLocation = const LatLng(12.9716, 77.5946); // Bangalore
  final LatLng userLocation = const LatLng(12.9352, 77.6146); // Sample nearby location

  Set<Marker> _getMarkers() {
    return {
      Marker(
        markerId: const MarkerId('caregiver'),
        position: caregiverLocation,
        infoWindow: const InfoWindow(title: 'Caregiver'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: const MarkerId('user'),
        position: userLocation,
        infoWindow: const InfoWindow(title: 'You'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Caregiver'),
        backgroundColor: Colors.teal,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: caregiverLocation,
          zoom: 14,
        ),
        markers: _getMarkers(),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
      ),
    );
  }
}
