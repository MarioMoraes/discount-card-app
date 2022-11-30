import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/core/widgets/custom_app_bar_title.dart';
import 'package:discount_card_app/app/models/pharmacy_and_prices_model.dart';
import 'package:discount_card_app/app/modules/drug/widgets/custom_filter_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../models/drug_model.dart';
import '../widgets/card_drug_pharmacy.dart';
import 'controller/pharmacy_list_state.dart';

class PharmaciesListDrugPage extends StatefulWidget {
  final PharmacyListController controller;
  final DrugModel model;

  const PharmaciesListDrugPage(
      {Key? key, required this.model, required this.controller})
      : super(key: key);

  @override
  State<PharmaciesListDrugPage> createState() => _PharmaciesListDrugPageState();
}

class _PharmaciesListDrugPageState extends State<PharmaciesListDrugPage> {
  @override
  void initState() {
    //! CHANGE LONGITUDE AND LATITUDE FOR DEVICE POINT
    widget.controller.getPharmaciesAndPrices(
        gpi14: widget.model.gpi14 ?? '',
        name: widget.model.name ?? '',
        lat: 41.8881604,
        long: -87.80669739999999);

    super.initState();
  }

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
            delegate: CustomFilterHeader(model: widget.model),
            pinned: true,
          ),
          BlocSelector<PharmacyListController, PharmacyListState, bool>(
            bloc: widget.controller,
            selector: (state) => state.status == SearchStatus.loading,
            builder: (context, showLoading) {
              return SliverVisibility(
                visible: showLoading,
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .55,
                    child: Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                          color: context.primaryColor, size: 35),
                    ),
                  ),
                ),
              );
            },
          ),
          BlocSelector<PharmacyListController, PharmacyListState,
              List<PharmacyAndPricesModel>>(
            bloc: widget.controller,
            selector: (state) => state.listPharmacies,
            builder: (context, state) {
              return SliverList(
                delegate: SliverChildListDelegate(
                  state.map((e) => CardDrugPharmacy(model: e)).toList(),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: showMap(),
    );
  }

  Widget showMap() {
    return BlocSelector<PharmacyListController, PharmacyListState,
        List<PharmacyAndPricesModel>>(
      bloc: widget.controller,
      selector: (state) => state.listPharmacies,
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (state.isNotEmpty) {
              Modular.to.pushNamed('/drug/map', arguments: state);
            }
          },
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
                  size: 30,
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
      },
    );
  }
}
