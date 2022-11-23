import 'package:discount_card_app/app/models/pharmacy_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/widgets/custom_app_bar_title.dart';

class PharmacyDetail extends StatelessWidget {
  final PharmacyLocation model;

  const PharmacyDetail({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTitle(
        msg: 'Pharmacies List',
        subtitle: 'Pharmacy Details',
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          _PharmacyAddress(model: model),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: _ShowMap(
                lat: model.location.latitude, long: model.location.longitude),
          ),
        ],
      ),
    );
  }
}

class _PharmacyAddress extends StatelessWidget {
  final PharmacyLocation model;
  const _PharmacyAddress({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .60,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text(
                  model.pharmacy.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade900,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Address',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .55,
                  child: Text(
                    model.pharmacy.address,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Phone',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text(
                  model.pharmacy.phoneNumber,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(55, 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'CALL',
                    style: TextStyle(color: Colors.white),
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

class _ShowMap extends StatefulWidget {
  final double lat;
  final double long;
  const _ShowMap({Key? key, required this.lat, required this.long})
      : super(key: key);

  @override
  State<_ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<_ShowMap> {
  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    _addMarker();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition _currentPosition = CameraPosition(
      target: LatLng(widget.lat, widget.long),
      zoom: 12.4746,
    );

    return GoogleMap(
      initialCameraPosition: _currentPosition,
      mapType: MapType.normal,
      markers: Set.from(allMarkers),
    );
  }

  _addMarker() {
    allMarkers.add(
      Marker(
          markerId: const MarkerId('idMarker'),
          draggable: true,
          position: LatLng(widget.lat, widget.long)),
    );
  }
}
