import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/widgets/custom_app_bar_title.dart';

class PharmacyDetail extends StatelessWidget {
  const PharmacyDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTitle(
        msg: 'Pharmacies List',
        subtitle: 'Pharmacy Details',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 20,
            ),
            _PharmacyAddress(),
            _ShowMap(),
          ],
        ),
      ),
    );
  }
}

class _PharmacyAddress extends StatelessWidget {
  const _PharmacyAddress({Key? key}) : super(key: key);

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
            width: MediaQuery.of(context).size.width / 2,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text(
                  'Sears Pharmacy #3223',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Address',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text(
                  '1003 MADISON ST',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Phone',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text(
                  '700884900',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 45,
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
  const _ShowMap({Key? key}) : super(key: key);

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
    const CameraPosition _currentPosition = CameraPosition(
      target: LatLng(41.8882523, -87.80376609999999),
      zoom: 12.4746,
    );

    return SizedBox(
      width: double.infinity,
      height: 450,
      child: Column(
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

  _addMarker() {
    allMarkers.add(
      const Marker(
          markerId: MarkerId('idMarker'),
          draggable: true,
          position: LatLng(41.8882523, -87.80376609999999)),
    );
  }
}
