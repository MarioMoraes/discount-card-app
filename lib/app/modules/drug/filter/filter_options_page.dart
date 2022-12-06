// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:discount_card_app/app/models/drug_model.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/filter_options_controller.dart';
import 'package:discount_card_app/app/modules/drug/filter/widgets/source_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/coverage_options.dart';
import 'widgets/distance_options.dart';
import 'widgets/dosage_options.dart';
import 'widgets/quantity_options.dart';
import 'widgets/type_options.dart';

class FilterOptionsPage extends StatefulWidget {
  final FilterOptionsController controller;
  final DrugModel model;

  const FilterOptionsPage({
    Key? key,
    required this.controller,
    required this.model,
  }) : super(key: key);

  @override
  State<FilterOptionsPage> createState() => _FilterOptionsPageState();
}

class _FilterOptionsPageState extends State<FilterOptionsPage> {
  @override
  void initState() {
    widget.controller.getFilter(widget.model.gpi14!);
    super.initState();
  }

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
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.filter_alt_off),
                label: const Text('Reset')),
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
          onPressed: () {
            Modular.to.pop(widget.controller);
          },
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
            padding: const EdgeInsets.all(0),
            children: [
              CoverageOptions(
                  coverageController: Modular.get<FilterOptionsController>()),
              const SizedBox(
                height: 15,
              ),
              TypeOptions(
                  typeController: Modular.get<FilterOptionsController>()),
              const SizedBox(
                height: 15,
              ),
              DosageOptions(
                  dosageController: Modular.get<FilterOptionsController>()),
              const SizedBox(
                height: 15,
              ),
              QuantityOptions(
                  quantityController: Modular.get<FilterOptionsController>()),
              const SizedBox(
                height: 20,
              ),
              DistanceOptions(
                  distanceController: Modular.get<FilterOptionsController>()),
              const SizedBox(
                height: 35,
              ),
              SourceLocation(
                  controller: Modular.get<FilterOptionsController>()),
            ],
          ),
        ),
      ),
    );
  }
}
