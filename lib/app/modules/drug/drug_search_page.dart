import 'package:discount_card_app/app/core/helpers/messages.dart';
import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/core/widgets/custom_menu_header.dart';
import 'package:discount_card_app/app/models/drug_model.dart';
import 'package:discount_card_app/app/modules/drug/controller/drug_search_state.dart';
import 'package:discount_card_app/app/modules/drug/widgets/card_popular_searches.dart';
import 'package:discount_card_app/app/modules/drug/widgets/card_search_drug.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DrugSearchPage extends StatefulWidget {
  final DrugSearchController controller;

  const DrugSearchPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<DrugSearchPage> createState() => _DrugSearchPageState();
}

class _DrugSearchPageState extends State<DrugSearchPage>
    with Messages<DrugSearchPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DrugSearchController, DrugSearchState>(
      bloc: widget.controller,
      listener: (context, state) {
        if (state.status == SearchStatus.empty) {
          showError('No Records Found');
        }
      },
      child: Scaffold(
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
                selector: (state) => state.status != SearchStatus.completed,
                builder: (context, show) {
                  return SliverVisibility(
                    visible: show,
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: SizedBox(
                          width: 150,
                          height: MediaQuery.of(context).size.height * .5,
                          child: Center(
                            child: SvgPicture.asset('assets/images/search.svg'),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              BlocSelector<DrugSearchController, DrugSearchState, bool>(
                bloc: widget.controller,
                selector: (state) => state.status == SearchStatus.loading,
                builder: (context, showLoading) {
                  return SliverVisibility(
                    visible: showLoading,
                    sliver: SliverToBoxAdapter(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: LoadingAnimationWidget.fourRotatingDots(
                              color: context.primaryColor, size: 35),
                        ),
                      ),
                    ),
                  );
                },
              ),
              BlocSelector<DrugSearchController, DrugSearchState,
                      List<DrugModel>>(
                  bloc: widget.controller,
                  selector: (state) => state.listDrugs,
                  builder: (context, list) {
                    return SliverList(
                        delegate: SliverChildListDelegate(list
                            .map((e) => CardSearchDrug(model: e))
                            .toList()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
