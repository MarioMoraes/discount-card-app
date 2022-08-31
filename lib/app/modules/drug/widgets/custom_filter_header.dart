import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomFilterHeader extends SliverPersistentHeaderDelegate {
  final int? _value = 0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ChoiceChip(
                    backgroundColor: Colors.grey.withOpacity(0.15),
                    labelPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    selectedShadowColor: const Color(0xff8EB14F),
                    elevation: 2,
                    label: Text('FILTER OPTIONS',
                        style: TextStyle(
                            fontSize: 12,
                            color: _value == 0 ? Colors.white : Colors.black)),
                    selected: _value == 0,
                    selectedColor: const Color(0xff8EB14F),
                    onSelected: (bool selected) {},
                  ),
                  ChoiceChip(
                    backgroundColor: Colors.grey.withOpacity(0.15),
                    labelPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    selectedShadowColor: const Color(0xff8EB14F),
                    elevation: 2,
                    label: Text('ORDER BY',
                        style: TextStyle(
                            fontSize: 12,
                            color: _value == 0 ? Colors.white : Colors.black)),
                    selected: _value == 0,
                    selectedColor: const Color(0xff8EB14F),
                    onSelected: (bool selected) {},
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: constraints.maxWidth,
                height: 30,
                decoration: BoxDecoration(
                  color: context.primaryColor,
                ),
                child: Row(children: const [
                  Icon(
                    Icons.add_location,
                    size: 16,
                    color: Colors.white,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Text(
                      'San Francisco, CA',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
