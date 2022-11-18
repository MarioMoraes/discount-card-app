import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/filter_options_controller.dart';
import 'package:flutter/material.dart';

class QuantityOptions extends StatefulWidget {
  final FilterOptionsController quantityController;
  const QuantityOptions({Key? key, required this.quantityController})
      : super(key: key);

  @override
  State<QuantityOptions> createState() => _QuantityOptionsState();
}

class _QuantityOptionsState extends State<QuantityOptions> {
  final _quantityEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'QUANTITY',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            width: 80,
            height: 35,
            decoration: BoxDecoration(
              color: context.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: TextFormField(
                controller: _quantityEC,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
