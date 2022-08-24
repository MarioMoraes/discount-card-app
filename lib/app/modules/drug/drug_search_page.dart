import 'package:discount_card_app/app/core/widgets/Custom_menu_header.dart';
import 'package:discount_card_app/app/modules/drug/widgets/card_search_drug.dart';
import 'package:flutter/material.dart';

class DrugSearchPage extends StatefulWidget {
  const DrugSearchPage({Key? key}) : super(key: key);

  @override
  State<DrugSearchPage> createState() => _DrugSearchPageState();
}

class _DrugSearchPageState extends State<DrugSearchPage> {
  @override
  Widget build(BuildContext context) {
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
      'Pharmacy 11',
      'Pharmacy 12',
      'Pharmacy 13',
      'Pharmacy 14',
      'Pharmacy 15',
      'Pharmacy 16',
      'Pharmacy 17',
      'Pharmacy 18',
      'Pharmacy 19',
      'Pharmacy 20',
    ];

    return Scaffold(
      // appBar: CustomAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0,
              toolbarHeight: 100,
              backgroundColor: Colors.white,
              centerTitle: true,
              automaticallyImplyLeading: true,
              title: SizedBox(
                child: Column(
                  children: [
                    /*
                    const SizedBox(
                      height: 15,
                    ),
                    */
                    Image.asset(
                      'assets/images/logo-client-crx.png',
                      fit: BoxFit.cover,
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: CustomMenuHeader(),
              pinned: true,
            ),
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
                delegate: SliverChildListDelegate(list
                    .map((e) => const CardSearchDrug(
                        drugName: 'Amoxicilin ',
                        brand: 'BRAND',
                        type: 'Tablet 50mg'))
                    .toList()))
          ],
        ),
      ),
    );
  }
}
