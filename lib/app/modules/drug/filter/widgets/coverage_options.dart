import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/models/filters.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/filter_options_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/widgets/card_select.dart';

class CoverageOptions extends StatefulWidget {
  final FilterOptionsController coverageController;

  const CoverageOptions({Key? key, required this.coverageController})
      : super(key: key);

  @override
  State<CoverageOptions> createState() => CoverageOptionsState();
}

class CoverageOptionsState extends State<CoverageOptions> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
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
            height: 5,
          ),
          SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: BlocBuilder<FilterOptionsController,
                        FilterOptionsState>(
                      bloc: widget.coverageController,
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
                          itemCount: state.listCoverages.length,
                          itemBuilder: (context, index) {
                            return CardSelect(
                              widget: Filters.coverage,
                              controller: widget.coverageController,
                              index: index,
                              title:
                                  state.listCoverages[index].description ?? '',
                              selected:
                                  state.listCoverages[index].selected ?? false,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
