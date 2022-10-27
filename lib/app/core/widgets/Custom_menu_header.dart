import 'dart:async';

import 'package:discount_card_app/app/core/widgets/custom_text_form_field.dart';
import 'package:discount_card_app/app/modules/drug/controller/drug_search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomMenuHeader extends SliverPersistentHeaderDelegate {
  final DrugSearchController controller;
  final String title;

  CustomMenuHeader({
    required this.title,
    required this.controller,
  });

  Timer? _debounce;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<DrugSearchController, DrugSearchState>(
          bloc: controller,
          builder: (context, state) {
            return Container(
                height: constraints.maxHeight,
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomTextFormField(
                        onChange: (value) {
                          controller.filter(value);
                        },
                        hint: title,
                        showIcon: true,
                        icon: Icons.search,
                      ),
                    ]));
          },
        );
      },
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
