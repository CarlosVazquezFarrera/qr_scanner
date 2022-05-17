import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scanner/models/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final double defaultZoom = 17.0;

  MapType mapType = MapType.normal;
  @override
  Widget build(BuildContext context) {
    final Scan scan = ModalRoute.of(context)!.settings.arguments as Scan;
    final CameraPosition position = CameraPosition(
      target: scan.getLatLng(),
      zoom: defaultZoom,
    );

    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
        markerId: const MarkerId('geo-location'), position: scan.getLatLng()));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: scan.getLatLng(), zoom: defaultZoom)));
            },
          )
        ],
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: position,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () {
          setState(() {
            mapType =
                mapType == MapType.normal ? MapType.satellite : MapType.normal;
          });
        },
      ),
    );
  }
}
