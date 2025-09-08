import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class userLocation extends StatefulWidget {
  const userLocation({super.key});

  @override
  State<userLocation> createState() => _userLocationState();
}

class _userLocationState extends State<userLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('data')));
  }
}
