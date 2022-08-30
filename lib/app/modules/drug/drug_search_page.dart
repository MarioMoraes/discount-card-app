import 'package:discount_card_app/app/core/widgets/custom_menu_header.dart';
import 'package:discount_card_app/app/modules/drug/widgets/card_popular_searches.dart';
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
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Drug Search',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
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
              delegate: SliverChildListDelegate(
                list
                    .map((e) => const CardSearchDrug(
                        drugName: 'Amoxicilin ',
                        brand: 'BRAND',
                        type: 'Tablet 50mg'))
                    .toList(),
              ),
            ),
            const SliverToBoxAdapter(
              child: CardPopularSearches(),
            ),
          ],
        ),
      ),
    );
  }
}
