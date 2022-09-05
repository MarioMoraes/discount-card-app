import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
                    label: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('FILTER OPTIONS',
                            style: TextStyle(
                                fontSize: 14,
                                color:
                                    _value == 0 ? Colors.white : Colors.black)),
                      ],
                    ),
                    selected: _value == 0,
                    selectedColor: const Color(0xff8EB14F),
                    onSelected: (bool selected) {
                      _showFilterOptions();
                    },
                  ),
                  ChoiceChip(
                    backgroundColor: Colors.grey.withOpacity(0.15),
                    labelPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    selectedShadowColor: const Color(0xff8EB14F),
                    elevation: 2,
                    label: Column(
                      children: [
                        Text('ORDER BY',
                            style: TextStyle(
                                fontSize: 14,
                                color:
                                    _value == 0 ? Colors.white : Colors.black)),
                      ],
                    ),
                    selected: _value == 0,
                    selectedColor: const Color(0xff8EB14F),
                    onSelected: (bool selected) {
                      _showOrderyBy(context);
                    },
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

  void _showFilterOptions() {
    Modular.to.pushNamed('/drug/filters');
  }

  void _showOrderyBy(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return SizedBox(
          height: 150,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                'ORDER BY',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: Color(0xff8EB14F),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(
                      Icons.attach_money_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'Nearest Pharmacy',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Lowest Price    ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
