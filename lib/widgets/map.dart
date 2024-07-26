import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapOfGoogle extends StatefulWidget {
  const MapOfGoogle({super.key});

  @override
  State<MapOfGoogle> createState() => _MapOfGoogleState();
}

class _MapOfGoogleState extends State<MapOfGoogle> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _intialLocation =
      CameraPosition(target: LatLng(33.6844, 73.047), zoom: 14);

  final List<Marker> _marker = const <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.6844, 73.047),
        infoWindow: InfoWindow(title: 'my Location'))
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GoogleMap(initialCameraPosition: _intialLocation,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },),
    );
    
  }
}
