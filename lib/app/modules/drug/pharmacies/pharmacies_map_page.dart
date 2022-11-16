import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';

import '../../../models/pharmacy_and_prices_model.dart';

class PharmaciesMapPage extends StatefulWidget {
  final List<PharmacyAndPricesModel> list;
  const PharmaciesMapPage({Key? key, required this.list}) : super(key: key);

  @override
  State<PharmaciesMapPage> createState() => _PharmaciesMapPageState();
}

class _PharmaciesMapPageState extends State<PharmaciesMapPage> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  GoogleMapController? mapController;

  Position? position, positionUser;

  final CameraPosition _currentPosition = const CameraPosition(
    target: LatLng(41.8882523, -87.80376609999999),
    zoom: 14.4746,
  );

  List<Marker> allMarkers = [];
  Set<Marker> mark = {};

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  _loadMarkers() async {
    await _addMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: () {
          Modular.to.pop();
        },
        child: const Text(
          'CLOSE MAP',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: _currentPosition,
              mapType: MapType.normal,
              markers: Set.from(mark.toList()),
            ),
          ),
        ],
      ),
    );
  }

  _addMarkers() async {
    for (int x = 0; x < widget.list.length; x++) {
      mark
          .addLabelMarker(LabelMarker(
        label: '\$ ' + widget.list[x].medication.price.toStringAsFixed(2),
        markerId: MarkerId(x.toString()),
        position: LatLng(
          widget.list[x].location.latitude,
          widget.list[x].location.longitude,
        ),
        backgroundColor: Colors.green,
        infoWindow: InfoWindow(
            title: widget.list[x].pharmacy.name,
            snippet: widget.list[x].pharmacy.address),
      ))
          .then(
        (value) {
          setState(() {});
        },
      );
    }
  }
}
