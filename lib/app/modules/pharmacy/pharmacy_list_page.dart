import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/models/pharmacy_location.dart';
import 'package:discount_card_app/app/modules/pharmacy/controller/pharmacy_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'widgets/card_pharmacy.dart';

class PharmacyListPage extends StatefulWidget {
  final PharmacyController controller;

  const PharmacyListPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PharmacyListPage> createState() => _PharmacyListPageState();
}

class _PharmacyListPageState extends State<PharmacyListPage> {
  @override
  void initState() {
    widget.controller.getAllPharmacies(
      latitude: 41.8881604,
      longitude: -87.80669739999999,
    );
    super.initState();
  }

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
            BlocSelector<PharmacyController, PharmacyState, bool>(
              bloc: widget.controller,
              selector: (state) => state.status == SearchStatus.loading,
              builder: (context, showLoading) {
                return SliverVisibility(
                  visible: showLoading,
                  sliver: SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .75,
                      child: Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                            color: context.primaryColor, size: 35),
                      ),
                    ),
                  ),
                );
              },
            ),
            BlocSelector<PharmacyController, PharmacyState,
                    List<PharmacyLocation>>(
                bloc: widget.controller,
                selector: (state) => state.listPharmacies,
                builder: (context, list) {
                  return SliverList(
                      delegate: SliverChildListDelegate(
                          list.map((e) => CardPharmacy(model: e)).toList()));
                }),
          ],
        ),
      ),
    );
  }
}
