import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/core/widgets/custom_app_bar_title.dart';
import 'package:discount_card_app/app/modules/drug/widgets/card_drug_pharmacy.dart';
import 'package:discount_card_app/app/modules/drug/widgets/custom_filter_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PharmaciesListDrugPage extends StatefulWidget {
  const PharmaciesListDrugPage({Key? key}) : super(key: key);

  @override
  State<PharmaciesListDrugPage> createState() => _PharmaciesListDrugPageState();
}

class _PharmaciesListDrugPageState extends State<PharmaciesListDrugPage> {
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
              list.map((e) => const CardDrugPharmacy()).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: showMap(),
    );
  }

  Widget showMap() {
    return InkWell(
      onTap: () => Modular.to.pushNamed('/drug/map'),
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: context.primaryColor,
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: const [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.map,
              color: Colors.white,
              size: 36,
            ),
            SizedBox(
              width: 5,
            ),
            Center(
              child: Text(
                'See Result \n  In Map',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
