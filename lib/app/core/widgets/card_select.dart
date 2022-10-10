import 'package:flutter/material.dart';

class CardSelect extends StatelessWidget {
  final dynamic controller;
  final int index;
  final String title;
  final bool selected;

  const CardSelect({
    Key? key,
    required this.controller,
    required this.index,
    required this.title,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        width: 100,
        decoration: BoxDecoration(
          color: selected ? const Color(0xff8EB14F) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(2, 4), // changes position of shadow
            ),
          ],
          border: Border.all(
            color: Colors.grey.shade400,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  _onTap() {
    controller.changeType(index);
  }
}