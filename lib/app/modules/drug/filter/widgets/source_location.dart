import 'package:discount_card_app/app/modules/drug/filter/controller/filter_options_controller.dart';
import 'package:flutter/material.dart';

class SourceLocation extends StatefulWidget {
  final FilterOptionsController controller;

  const SourceLocation({Key? key, required this.controller}) : super(key: key);

  @override
  State<SourceLocation> createState() => _SourceLocationState();
}

class _SourceLocationState extends State<SourceLocation> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'SOURCE LOCATION',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Row(
                  children: [
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'FROM DEVICE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 4,
                            offset: const Offset(
                                2, 4), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'USER DEFINED',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
