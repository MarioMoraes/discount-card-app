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
  void initState() {
    super.initState();
    widget.coverageController.getCoverage();
  }

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
                BlocBuilder<CoverageController, CoverageState>(
                  bloc: widget.coverageController,
                  builder: (context, state) {
                    if (state is CoverageStateLoading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }

                    if (state is CoverageStateLoaded) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.list.length,
                        itemBuilder: ((context, index) {
                          var model = state.list[index];
                          return CardSelect(
                            controller: widget.coverageController,
                            title: model.description!,
                            selected: model.selected!,
                            index: index,
                          );
                        }),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
