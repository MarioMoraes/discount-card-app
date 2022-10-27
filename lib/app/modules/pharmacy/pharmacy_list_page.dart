import 'package:flutter/material.dart';

import 'widgets/card_pharmacy.dart';

class PharmacyListPage extends StatelessWidget {
  PharmacyListPage({Key? key}) : super(key: key);

  final List<String> list = [
    'Pharmacy',
    'Pharmacy 2',
    'Pharmacy 3',
    'Pharmacy 4',
    'Pharmacy 5',
    'Pharmacy 6',
    'Pharmacy 6',
    'Pharmacy 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Pharmacies List',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            // SliverPersistentHeader(
            //   delegate: CustomMenuHeader(title: 'Pharmacy Name'),
            //   pinned: true,
            // ),
            const SliverVisibility(
              visible: false,
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(
                    list.map((e) => const CardPharmacy()).toList())),
          ],
        ),
      ),
    );
  }
}
