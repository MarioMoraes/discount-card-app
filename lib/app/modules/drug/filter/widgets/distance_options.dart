import 'package:discount_card_app/app/modules/drug/filter/controller/filter_options_controller.dart';
import 'package:flutter/material.dart';

class DistanceOptions extends StatefulWidget {
  final FilterOptionsController distanceController;

  const DistanceOptions({Key? key, required this.distanceController})
      : super(key: key);

  @override
  State<DistanceOptions> createState() => DistanceOptionsState();
}

class DistanceOptionsState extends State<DistanceOptions> {
  final _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'DISTANCE',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Slider(
          value: _sliderValue,
          max: 100,
          divisions: 5,
          //label: widget.distanceController.value.round().toString(),
          onChanged: (double value) {
            //widget.distanceController.setDistance(value);
            setState(() {});
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            children: [
              Text(
                '5 miles',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              const Spacer(),
              Text(
                '100 miles',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
        )
      ],
    );
  }
}
