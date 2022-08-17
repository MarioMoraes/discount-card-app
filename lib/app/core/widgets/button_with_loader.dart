import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonWithLoader<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final BlocWidgetSelector<S, bool> selector;

  final B bloc;
  final VoidCallback onPressed;
  final String label;
  final Color? labelCor;
  final double? labelSize;

  const ButtonWithLoader({
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
    return ElevatedButton(
      onPressed: onPressed,
      child: BlocSelector<B, S, bool>(
        bloc: bloc,
        selector: selector,
        builder: (context, showLoading) {
          if (!showLoading) {
            return Text(
              label,
              style: TextStyle(
                fontSize: labelSize,
                fontWeight: FontWeight.w500,
                color: labelCor ?? Colors.black,
              ),
            );
          }
          return Stack(
            children: const [
              Align(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                  strokeWidth: 2,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
