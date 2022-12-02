import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/models/drug_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../pharmacies/controller/pharmacy_list_state.dart';

class CustomFilterHeader extends SliverPersistentHeaderDelegate {
  final DrugModel model;
  final PharmacyListController controller;

  CustomFilterHeader({
    required this.model,
    required this.controller,
  });

  final int? _value = 0;
  dynamic filterController;
  String? _coverage;
  String? _type;
  String? _strengthUnit;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ChoiceChip(
                    backgroundColor: Colors.grey.withOpacity(0.15),
                    labelPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    selectedShadowColor: const Color(0xff8EB14F),
                    elevation: 2,
                    label: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('FILTER OPTIONS',
                            style: TextStyle(
                                fontSize: 14,
                                color:
                                    _value == 0 ? Colors.white : Colors.black)),
                      ],
                    ),
                    selected: _value == 0,
                    selectedColor: const Color(0xff8EB14F),
                    onSelected: (bool selected) async {
                      await _showFilterOptions();

                      //! CHANGE LONGITUDE AND LATITUDE FOR DEVICE POINT
                      controller.getPharmaciesAndPrices(
                        gpi14: model.gpi14 ?? '',
                        name: model.name ?? '',
                        lat: 41.8881604,
                        long: -87.80669739999999,
                        quantity: 1,
                        distance: 5,
                        coverage: _coverage,
                        type: _type,
                        strengthUnit: _strengthUnit,
                      );
                    },
                  ),
                  ChoiceChip(
                    backgroundColor: Colors.grey.withOpacity(0.15),
                    labelPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    selectedShadowColor: const Color(0xff8EB14F),
                    elevation: 2,
                    label: Column(
                      children: [
                        Text('ORDER BY',
                            style: TextStyle(
                                fontSize: 14,
                                color:
                                    _value == 0 ? Colors.white : Colors.black)),
                      ],
                    ),
                    selected: _value == 0,
                    selectedColor: const Color(0xff8EB14F),
                    onSelected: (bool selected) {
                      _showOrderyBy(context);
                    },
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: constraints.maxWidth,
                height: 30,
                decoration: BoxDecoration(
                  color: context.primaryColor,
                ),
                child: Row(children: const [
                  Icon(
                    Icons.add_location,
                    size: 16,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'San Francisco, CA',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Future _showFilterOptions() async {
    filterController =
        await Modular.to.pushNamed('/drug/filters', arguments: model);
    _getParameters();
  }

  void _showOrderyBy(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return SizedBox(
          height: 180,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                'ORDER BY',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: Color(0xff8EB14F),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(
                      Icons.attach_money_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 170,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Nearest Pharmacy',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Lowest Price',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getParameters() async {
    _coverage = filterController.listCoverages
        .where((element) => element.selected == true)
        .toSet()
        .toList()[0]
        .description;

    _type = filterController.listTypes
        .where((element) => element.selected == true)
        .toSet()
        .toList()[0]
        .description;

    _strengthUnit = filterController.listDosages
        .where((element) => element.selected == true)
        .toSet()
        .toList()[0]
        .description;

    if (_strengthUnit != null) {
      var strength = _strengthUnit!.split(' ');
      _strengthUnit = strength[1];
    }
  }
}
