import 'package:discount_card_app/app/models/card_select_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/card_select.dart';
import '../controller/coverage_state.dart';

class CoverageOptions extends StatefulWidget {
  final CoverageController coverageController;

  const CoverageOptions({Key? key, required this.coverageController})
      : super(key: key);

  @override
  State<CoverageOptions> createState() => CoverageOptionsState();
}

class CoverageOptionsState extends State<CoverageOptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'COVERAGE',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                BlocSelector<CoverageController, CoverageState,
                        List<CardSelectModel>>(
                    bloc: widget.coverageController,
                    selector: (state) => state.list,
                    builder: (context, list) {
                      return SliverList(
                          delegate: SliverChildListDelegate(list
                              .map((e) => CardSelect(
                                    controller: widget.coverageController,
                                    title: e.description!,
                                    selected: e.selected!,
                                    index: e.hashCode,
                                  ))
                              .toList()));
                    })
              ],
            ),
          ),
        )
      ],
    );
  }
}
