import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/filter_options_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/widgets/card_select.dart';
import '../../../../models/card_select_model.dart';

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
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'TYPE',
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
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BlocSelector<FilterOptionsController, FilterOptionsState,
                        bool>(
                      bloc: widget.dosageController,
                      selector: (state) => state.status == SearchStatus.loading,
                      builder: (context, showLoading) {
                        if (showLoading) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * .30,
                            child: Center(
                              child: LoadingAnimationWidget.fourRotatingDots(
                                  color: context.primaryColor, size: 35),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    BlocSelector<FilterOptionsController, FilterOptionsState,
                            List<CardSelectModel>>(
                        bloc: widget.dosageController,
                        selector: (state) => state.listCoverages,
                        builder: (context, list) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return CardSelect(
                                controller: widget.dosageController,
                                index: index,
                                title: list[index].description ?? '',
                                selected: list[index].selected ?? false,
                              );
                            },
                          );
                        })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
