import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // _controller.moveCamera(CameraUpdate.zoomIn());
              _controller.animateCamera(CameraUpdate.zoomIn());
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              _controller.animateCamera(CameraUpdate.zoomOut());
            },
            icon: Icon(Icons.minimize),
          ),
          IconButton(
            onPressed: () {
              _controller
                  .animateCamera(CameraUpdate.newLatLng(LatLng(30.05, 31.277)));
            },
            icon: Icon(Icons.location_city),
          ),
        ],
      ),
      body: GoogleMap(
        // mapType: MapType.satellite,
        trafficEnabled: true,
        polylines: {
          Polyline(
            polylineId: PolylineId("1"),
            points: [
              LatLng(30.05, 31.277),
              LatLng(30.047929227109968, 31.262480802834034)
            ],
          )
        },
        markers: {
          Marker(
            markerId: MarkerId('1'),
            position: LatLng(30.047929227109968, 31.262480802834034),
          ),
          Marker(
            markerId: MarkerId('2'),
            position: LatLng(30.05, 31.277),
          ),
        },
        // myLocationButtonEnabled: true,
        // myLocationEnabled: true,
        onMapCreated: (controller) {
          _controller = controller;
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,

        onTap: (argument) {
          print(argument);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(30.047929227109968, 31.262480802834034),
          zoom: 15,
        ),
      ),
    );
  }
}
