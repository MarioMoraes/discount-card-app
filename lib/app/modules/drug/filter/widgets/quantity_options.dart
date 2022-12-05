import 'package:discount_card_app/app/modules/drug/filter/controller/filter_options_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_touch_spin/flutter_touch_spin.dart';

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
  void initState() {
    _quantityEC.text = '0';
    super.initState();
  }

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
        SizedBox(
          width: 160,
          height: 60,
          child: TouchSpin(
            min: 1,
            max: 50,
            step: 1,
            value: 1,
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            iconSize: 35.0,
            addIcon: const Icon(Icons.add_circle_outline),
            subtractIcon: const Icon(Icons.remove_circle_outline),
            iconActiveColor: Colors.green,
            iconDisabledColor: Colors.grey,
            iconPadding: const EdgeInsets.only(left: 15, right: 15),
            onChanged: (val) {
              widget.quantityController.setQuantity(val.toInt());
            },
          ),
        ),
      ],
    );
  }
}
