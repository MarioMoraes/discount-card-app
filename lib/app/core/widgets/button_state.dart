import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class ButtonState extends StatelessWidget {
  final String hint;
  final bool onOff;
  final ValueNotifier<bool> _onOffVN;

  ButtonState({
    Key? key,
    required this.hint,
    this.onOff = false,
  })  : _onOffVN = ValueNotifier<bool>(onOff),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _onOffVN,
      builder: (_, onOffVNValue, child) {
        return InkWell(
          onTap: () {
            _onOffVN.value = !onOffVNValue;
          },
          child: Container(
            width: hint.trim().length + 220,
            height: 40,
            decoration: BoxDecoration(
              color: onOffVNValue
                  ? context.primaryColor
                  : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.grey.withOpacity(0.1),
              ),
            ),
            child: Center(
              child: Text(
                hint,
                style: TextStyle(
                  color: onOffVNValue ? Colors.white : Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
