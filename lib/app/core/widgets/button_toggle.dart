import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonToggle<B extends StateStreamable<S>, S> extends StatelessWidget {
  final BlocWidgetSelector<S, bool> selector;

  final B bloc;
  final VoidCallback onPressed;
  final String label;
  final Color? labelCor;
  final double? labelSize;

  const ButtonToggle({
    Key? key,
    required this.selector,
    required this.bloc,
    required this.onPressed,
    required this.label,
    this.labelCor,
    this.labelSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<B, S, bool>(
      bloc: bloc,
      selector: selector,
      builder: (context, state) {
        return InkWell(
          onTap: null,
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.grey.withOpacity(0.1),
              ),
            ),
          ),
        );
      },
    );
  }
}
