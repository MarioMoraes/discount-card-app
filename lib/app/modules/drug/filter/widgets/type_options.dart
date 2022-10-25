import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/card_select.dart';
import '../controller/type_state.dart';

class TypeOptions extends StatefulWidget {
  final TypeController typeController;

  const TypeOptions({Key? key, required this.typeController}) : super(key: key);

  @override
  State<TypeOptions> createState() => TypeOptionsState();
}

class TypeOptionsState extends State<TypeOptions> {
  @override
  void initState() {
    super.initState();
    widget.typeController.getTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
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
            padding: const EdgeInsets.only(left: 25.0, right: 10),
            child: Row(
              children: [
                BlocBuilder<TypeController, TypeState>(
                  bloc: widget.typeController,
                  builder: (context, state) {
                    if (state is TypeStateLoading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }

                    if (state is TypeStateLoaded) {
                      return Flexible(
                        flex: 1,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.list.length,
                          itemBuilder: ((context, index) {
                            var model = state.list[index];
                            return CardSelect(
                              controller: widget.typeController,
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
