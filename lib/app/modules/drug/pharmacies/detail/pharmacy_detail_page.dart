import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/widgets/custom_app_bar_title.dart';

class PharmacyDetailPage extends StatelessWidget {
  const PharmacyDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTitle(
        msg: 'Drug Search',
        subtitle: 'Pharmacy Detail',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            _DrugDetails(),
            _PharmacyAddress(),
            _ShowMap(),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: () {},
        icon: const Icon(
          Icons.badge,
          color: Colors.white,
        ),
        label: const Text(
          'SHOW DISCOUNT CARD',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _DrugDetails extends StatelessWidget {
  const _DrugDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: double.infinity,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Amoxicilin',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$1.99',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff04461F),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '30 Tablets 40Mg',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
              Text(
                '\$5.0 Bonus Saving',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Image.asset(
              'assets/images/wal.png',
              height: 50,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Open',
                style: TextStyle(
                  color: context.primaryColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Until 9:00pm',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ],
          )
        ],
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
      width: double.infinity,
      height: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Located At',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          const Text(
            '1003 MADISON ST',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Phone',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          const Text(
            '700884900',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 30),
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
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _ShowMap extends StatelessWidget {
  const _ShowMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const CameraPosition _currentPosition = CameraPosition(
      target: LatLng(41.8882523, -87.80376609999999),
      zoom: 12.4746,
    );

    return Container(
      width: double.infinity,
      height: 500,
      child: Column(
        children: const [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: _currentPosition,
              mapType: MapType.normal,
            ),
          ),
        ],
      ),
    );
  }
}
