import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';

class PharmaciesMapPage extends StatefulWidget {
  const PharmaciesMapPage({Key? key}) : super(key: key);

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

  final List _pharmacies = [
    {
      "latitude": 41.8882523,
      "longitude": -87.80376609999999,
      "price": 1.99,
      "pharmacy": "WallMart",
      "address": "7251 WEST LAKE ST ",
    },
    {
      "latitude": 41.8881604,
      "longitude": -87.80669739999999,
      "price": 2.75,
      "pharmacy": "Walgreens",
      "address": "1003 MADISON ST ",
    },
    {
      "latitude": 41.8794785,
      "longitude": -87.80010539999999,
      "price": 1.78,
      "pharmacy": "CVS Pharmacy",
      "address": "811 MADISON ST ",
    },
    {
      "latitude": 41.8795471,
      "longitude": -87.79454679999999,
      "price": 4.01,
      "pharmacy": "Sears Pharmacy",
      "address": "7523 W LAKE ST",
    },
    {
      "latitude": 41.888288,
      "longitude": -87.81315819999999,
      "price": 3.50,
      "pharmacy": "WallMart",
      "address": "",
    },
    {
      "latitude": 41.8801753,
      "longitude": -87.7863787,
      "price": 1.99,
      "pharmacy": "Walgreens",
      "address": "1003 MADISON ST ",
    },
    {
      "latitude": 41.8796153,
      "longitude": -87.78349539999999,
      "price": 2.30,
      "pharmacy": "CVS Pharmacy",
      "address": "811 MADISON ST",
    },
    {
      "latitude": 41.8655024,
      "longitude": -87.78471859999999,
      "price": 2.60,
      "pharmacy": "Sears Pharmacy7",
      "address": "7251 WEST LAKE ST ",
    },
  ];

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
    for (int x = 0; x < _pharmacies.length; x++) {
      mark
          .addLabelMarker(
        LabelMarker(
          label: '\$ ' + _pharmacies[x]['price'].toString(),
          markerId: MarkerId(_pharmacies[x]['latitude'].toString()),
          position: LatLng(
            _pharmacies[x]['latitude'],
            _pharmacies[x]['longitude'],
          ),
          backgroundColor: Colors.green,
          infoWindow: InfoWindow(
            title: _pharmacies[x]['pharmacy'],
            snippet: _pharmacies[x]['address'],
          ),
        ),
      )
          .then(
        (value) {
          setState(() {});
        },
      );
    }
  }
}
