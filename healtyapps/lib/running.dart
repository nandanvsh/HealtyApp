import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class RunningTrackerApp extends StatelessWidget {
  const RunningTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const TrackingRunningApp();
  }
}

class TrackingRunningApp extends StatefulWidget {
  const TrackingRunningApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TrackingRunningAppState createState() => _TrackingRunningAppState();
}

class _TrackingRunningAppState extends State<TrackingRunningApp> {
  final Completer<GoogleMapController> _controller = Completer();
  final Location _location = Location();
  bool _isTracking = false;
  LatLng _startLocation = const LatLng(0, 0);
  LatLng? _endLocation;
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _location.onLocationChanged.listen((LocationData currentLocation) {
      if (_isTracking) {
        _updateMapLocation(currentLocation);
      }
    });
  }

  Future<void> _updateMapLocation(LocationData currentLocation) async {
    final GoogleMapController controller = await _controller.future;
    final LatLng currentLatLng =
        LatLng(currentLocation.latitude!, currentLocation.longitude!);

    setState(() {
      if (_isTracking) {
        _endLocation = currentLatLng;
        _polylines.add(
          Polyline(
            polylineId: const PolylineId('runningPath'),
            points: [_startLocation, _endLocation!],
            color: Colors.blue,
            width: 5,
          ),
        );
      } else {
        _startLocation = currentLatLng;
        _endLocation = null;
        _polylines.clear();
      }
    });

    controller.animateCamera(CameraUpdate.newLatLng(currentLatLng));
  }

  void _startTracking() {
    setState(() {
      _isTracking = true;
    });
  }

  void _stopTracking() {
    setState(() {
      _isTracking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Running Tracker'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: LatLng(0, 0),
              zoom: 17.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            polylines: _polylines,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isTracking ? _stopTracking : _startTracking,
                  child: Text(
                    _isTracking ? 'Stop' : 'Start',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
