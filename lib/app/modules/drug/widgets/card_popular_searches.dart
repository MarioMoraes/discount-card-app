import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class CardPopularSearches extends StatefulWidget {
  const CardPopularSearches({Key? key}) : super(key: key);

  @override
  State<CardPopularSearches> createState() => _CardPopularSearchesState();
}

class _CardPopularSearchesState extends State<CardPopularSearches> {
  int? _value = 0;

  final double _height = 100;

  final List<String> options = ['LIPTOR', 'SLIDENAFIL', 'NORVASC'];
  final List<String> options2 = ['ZOLOFT', 'LEXAPRO', 'COZAAR'];
  final List<String> options3 = ['AMOXICILIN', 'ABILIFY', 'LEXAPRO'];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 210,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border(
              top: BorderSide(width: 4, color: context.primaryColor),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Popular Searches'),
                const SizedBox(
                  height: 5,
                ),
                firstRow(),
                secondRow(),
                const SizedBox(
                  height: 15,
                ),
                const Text('Recent Searches'),
                const SizedBox(
                  height: 5,
                ),
                thirdRow(),
              ],
            ),
          )),
    );
  }

  Widget firstRow() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Row(
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: options.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ChoiceChip(
                  backgroundColor: Colors.grey.withOpacity(0.15),
                  labelPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  selectedShadowColor: const Color(0xff8EB14F),
                  elevation: 2,
                  label: Text(options[index],
                      style: TextStyle(
                          fontSize: 12,
                          color:
                              _value == index ? Colors.white : Colors.black)),
                  selected: _value == index,
                  selectedColor: const Color(0xff8EB14F),
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                    });
                  },
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget secondRow() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Row(
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: options.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ChoiceChip(
                  backgroundColor: Colors.grey.withOpacity(0.15),
                  labelPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  selectedShadowColor: const Color(0xff8EB14F),
                  elevation: 2,
                  label: Text(options2[index],
                      style: TextStyle(
                          fontSize: 12,
                          color:
                              _value == index ? Colors.white : Colors.black)),
                  selected: _value == index,
                  selectedColor: const Color(0xff8EB14F),
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                    });
                  },
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget thirdRow() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Row(
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: options.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ChoiceChip(
                  backgroundColor: Colors.grey.withOpacity(0.15),
                  labelPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  selectedShadowColor: const Color(0xff8EB14F),
                  elevation: 2,
                  label: Text(options3[index],
                      style: TextStyle(
                          fontSize: 12,
                          color:
                              _value == index ? Colors.white : Colors.black)),
                  selected: _value == index,
                  selectedColor: const Color(0xff8EB14F),
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                    });
                  },
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
