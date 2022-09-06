import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    target: LatLng(41.8881604, -87.80669739999999),
    zoom: 14.4746,
  );

  List<Marker> allMarkers = [];

  final markerKey = GlobalKey();

  final List _pharmacies = [
    {"latitude": 41.8882523, "longitude": -87.80376609999999},
    {"latitude": 41.8881604, "longitude": -87.80669739999999},
    {"latitude": 41.8794785, "longitude": -87.80010539999999},
    {"latitude": 41.8795471, "longitude": -87.79454679999999},
    {"latitude": 41.888288, "longitude": -87.81315819999999},
    {"latitude": 41.8801753, "longitude": -87.7863787},
    {"latitude": 41.8796153, "longitude": -87.78349539999999},
    {"latitude": 41.8655024, "longitude": -87.78471859999999},
  ];

  @override
  void initState() {
    super.initState();
    _adicionaMarcadores();
    print('teste');
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
              markers: Set.from(allMarkers),
            ),
          ),
        ],
      ),
    );
  }

  _adicionaMarcadores() async {
    for (int x = 0; x < _pharmacies.length; x++) {
      BitmapDescriptor? cor;

      cor = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);

      allMarkers.add(
        Marker(
            markerId: const MarkerId('downloadResizePictureCircle'),
            draggable: true,
            onTap: () {},
            position:
                LatLng(_pharmacies[x]['latitude'], _pharmacies[x]['longitude']),
            icon: cor),
      );
    }
  }
}
