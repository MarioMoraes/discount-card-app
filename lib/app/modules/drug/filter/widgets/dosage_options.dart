import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/models/filters.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/filter_options_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/widgets/card_select.dart';

class DosageOptions extends StatefulWidget {
  final FilterOptionsController dosageController;

  const DosageOptions({Key? key, required this.dosageController})
      : super(key: key);

  @override
  State<DosageOptions> createState() => DosageOptionsState();
}

class DosageOptionsState extends State<DosageOptions> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Column(
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
            height: 5,
          ),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: BlocBuilder<FilterOptionsController,
                            FilterOptionsState>(
                        bloc: widget.dosageController,
                        builder: (context, state) {
                          if (state.status == SearchStatus.loading) {
                            return Center(
                              child: LoadingAnimationWidget.fourRotatingDots(
                                  color: context.primaryColor, size: 35),
                            );
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: state.listDosages.length,
                            itemBuilder: (context, index) {
                              return CardSelect(
                                widget: Filters.dosage,
                                controller: widget.dosageController,
                                index: index,
                                title:
                                    state.listDosages[index].description ?? '',
                                selected:
                                    state.listDosages[index].selected ?? false,
                              );
                            },
                          );
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
