import 'package:discount_card_app/app/core/helpers/loader.dart';
import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/core/widgets/custom_menu_header.dart';
import 'package:discount_card_app/app/modules/drug/controller/drug_search_state.dart';
import 'package:discount_card_app/app/modules/drug/widgets/card_popular_searches.dart';
import 'package:discount_card_app/app/modules/drug/widgets/card_search_drug.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrugSearchPage extends StatefulWidget {
  final DrugSearchController controller;

  const DrugSearchPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<DrugSearchPage> createState() => _DrugSearchPageState();
}

class _DrugSearchPageState extends State<DrugSearchPage>
    with Loader<DrugSearchPage> {
  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: const CardPopularSearches(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: CustomMenuHeader(
                title: 'Drug Name',
                controller: widget.controller,
              ),
              pinned: true,
            ),
            BlocSelector<DrugSearchController, DrugSearchState, bool>(
              bloc: widget.controller,
              selector: (state) => (state is DrugSearchStateLoading),
              builder: (context, showLoading) {
                return SliverVisibility(
                  visible: showLoading,
                  sliver: SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              context.primaryColor),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<DrugSearchController, DrugSearchState>(
              bloc: widget.controller,
              builder: (context, state) {
                if (state is DrugSearchStateLoaded) {
                  return SliverList(
                      delegate: SliverChildListDelegate(state.listDrugs
                          .map((e) => CardSearchDrug(
                                drugName: e.name ?? '',
                                brand: e.coverage ?? '',
                                type: e.dosage ?? '',
                              ))
                          .toList()));
                }
                return const SliverToBoxAdapter();
              },
            ),
          ],
        ),
      ),
    );
  }
}
