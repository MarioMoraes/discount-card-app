import 'package:discount_card_app/app/core/widgets/custom_app_bar_title.dart';
import 'package:discount_card_app/app/modules/drug/widgets/card_drug_pharmacy.dart';
import 'package:discount_card_app/app/modules/drug/widgets/custom_filter_header.dart';
import 'package:flutter/material.dart';

class PharmaciesListPage extends StatefulWidget {
  const PharmaciesListPage({Key? key}) : super(key: key);

  @override
  State<PharmaciesListPage> createState() => _PharmaciesListPageState();
}

class _PharmaciesListPageState extends State<PharmaciesListPage> {
  final List<String> list = [
    'Pharmacy',
    'Pharmacy 2',
    'Pharmacy 3',
    'Pharmacy 4',
    'Pharmacy 5',
    'Pharmacy 6',
    'Pharmacy 7',
    'Pharmacy 8',
    'Pharmacy 9',
    'Pharmacy 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTitle(
        msg: 'Drug Search',
        subtitle: 'Pharmacies List',
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomFilterHeader(),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
                list.map((e) => const CardDrugPharmacy()).toList()),
          ),
        ],
      ),
    );
  }
}
