import 'package:discount_card_app/app/modules/drug/filter/controller/coverage_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/dosage_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/quantity_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/type_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/widgets/dosage_options.dart';
import 'package:discount_card_app/app/modules/drug/filter/widgets/quantity_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/coverage_options.dart';
import 'widgets/type_options.dart';

class FilterOptionsPage extends StatefulWidget {
  const FilterOptionsPage({Key? key}) : super(key: key);

  @override
  State<FilterOptionsPage> createState() => _FilterOptionsPageState();
}

class _FilterOptionsPageState extends State<FilterOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Text(
            'FILTER OPTIONS',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ],
        ),
        bottomNavigationBar: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          onPressed: () {},
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
          label: const Text(
            'APPLY FILTERS',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              CoverageOptions(
                  coverageController: Modular.get<CoverageController>()),
              const SizedBox(
                height: 15,
              ),
              TypeOptions(typeController: Modular.get<TypeController>()),
              const SizedBox(
                height: 15,
              ),
              DosageOptions(dosageController: Modular.get<DosageController>()),
              const SizedBox(
                height: 15,
              ),
              QuantityOptions(
                  quantityController: Modular.get<QuantityController>()),
              // const _Quantity(),
              // const SizedBox(
              //   height: 17,
              // ),
              // const _Distance(),
              // const SizedBox(
              //   height: 15,
              // ),
              // const _SourceLocation(),
            ],
          ),
        ),
      ),
    );
  }
}
