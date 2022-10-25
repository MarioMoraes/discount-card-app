import 'package:discount_card_app/app/modules/drug/filter/controller/dosage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/card_select.dart';

class DosageOptions extends StatefulWidget {
  final DosageController dosageController;

  const DosageOptions({Key? key, required this.dosageController})
      : super(key: key);

  @override
  State<DosageOptions> createState() => DosageOptionsState();
}

class DosageOptionsState extends State<DosageOptions> {
  @override
  void initState() {
    super.initState();
    widget.dosageController.getDosage();
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
              'DOSAGE',
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
                BlocBuilder<DosageController, DosageState>(
                  bloc: widget.dosageController,
                  builder: (context, state) {
                    if (state is DosageStateLoading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }

                    if (state is DosageStateLoaded) {
                      return Flexible(
                        flex: 1,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.list.length,
                          itemBuilder: ((context, index) {
                            var model = state.list[index];
                            return CardSelect(
                              controller: widget.dosageController,
                              title: model.description!,
                              selected: model.selected!,
                              index: index,
                            );
                          }),
                        ),
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
