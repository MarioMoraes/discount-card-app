import 'package:discount_card_app/app/core/widgets/custom_text_form_field.dart';
import 'package:discount_card_app/app/models/chip_model.dart';
import 'package:flutter/material.dart';

class FilterOptionsPage extends StatelessWidget {
  const FilterOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text(
          'FILTER OPTIONS',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ],
      ),
      bottomNavigationBar: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: () {},
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
        label: const Text(
          'APPLY FILTERS',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: const [
          _CoverageOptions(),
          SizedBox(
            height: 10,
          ),
          _TypeOptions(),
          SizedBox(
            height: 10,
          ),
          _DosageOptions(),
          SizedBox(
            height: 10,
          ),
          _Quantity(),
          SizedBox(
            height: 10,
          ),
          _Distance(),
          SizedBox(
            height: 10,
          ),
          _SourceLocation(),
        ],
      ),
    );
  }
}

class _SourceLocation extends StatelessWidget {
  const _SourceLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChipModel> list = [
      ChipModel(title: 'FROM DEVICE', selected: false),
      ChipModel(title: 'USER DEFINED', selected: true),
    ];

    int? _value = 0;

    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text('SOURCE LOCATION'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: ((context, index) {
                    var chip = list[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ChoiceChip(
                        visualDensity: VisualDensity.comfortable,
                        backgroundColor: chip.selected == true
                            ? const Color(0xff8EB14F)
                            : Colors.grey.shade200,
                        labelPadding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                        selectedShadowColor: const Color(0xff8EB14F),
                        elevation: 2,
                        label: Text(chip.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color:
                                  chip.selected ? Colors.white : Colors.black,
                            )),
                        selected: _value == index,
                        selectedColor: chip.selected == true
                            ? const Color(0xff8EB14F)
                            : Colors.grey.shade200,
                        onSelected: (bool selected) {},
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _Distance extends StatelessWidget {
  const _Distance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text('DISTANCE'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: RangeSlider(
                    values: const RangeValues(5, 30),
                    labels: const RangeLabels('5', '30'),
                    min: 5,
                    max: 30,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Quantity extends StatelessWidget {
  const _Quantity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text('QUANTITY'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 100,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: CustomTextFormField(hint: '1'),
          ),
        ),
      ],
    );
  }
}

class _DosageOptions extends StatelessWidget {
  const _DosageOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChipModel> list = [
      ChipModel(title: '100 ml', selected: false),
      ChipModel(title: '150 ml', selected: false),
      ChipModel(title: '200 ml', selected: true),
    ];

    int? _value = 0;

    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text('DOSAGE'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: ((context, index) {
                    var chip = list[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ChoiceChip(
                        visualDensity: VisualDensity.comfortable,
                        backgroundColor: chip.selected == true
                            ? const Color(0xff8EB14F)
                            : Colors.grey.shade200,
                        labelPadding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                        selectedShadowColor: const Color(0xff8EB14F),
                        elevation: 2,
                        label: Text(chip.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color:
                                  chip.selected ? Colors.white : Colors.black,
                            )),
                        selected: _value == index,
                        selectedColor: chip.selected == true
                            ? const Color(0xff8EB14F)
                            : Colors.grey.shade200,
                        onSelected: (bool selected) {},
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _TypeOptions extends StatelessWidget {
  const _TypeOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChipModel> list = [
      ChipModel(title: 'TABS', selected: true),
      ChipModel(title: 'SOLN', selected: false),
      ChipModel(title: 'TBDP', selected: false),
    ];

    int? _value = 0;

    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text('TYPE'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: ((context, index) {
                    var chip = list[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ChoiceChip(
                        visualDensity: VisualDensity.comfortable,
                        backgroundColor: chip.selected == true
                            ? const Color(0xff8EB14F)
                            : Colors.grey.shade200,
                        labelPadding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                        selectedShadowColor: const Color(0xff8EB14F),
                        elevation: 2,
                        label: Text(chip.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color:
                                  chip.selected ? Colors.white : Colors.black,
                            )),
                        selected: _value == index,
                        selectedColor: chip.selected == true
                            ? const Color(0xff8EB14F)
                            : Colors.grey.shade200,
                        onSelected: (bool selected) {},
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _CoverageOptions extends StatelessWidget {
  const _CoverageOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChipModel> list = [
      ChipModel(title: 'BRAND', selected: true),
      ChipModel(title: 'GENERIC', selected: false),
    ];

    int? _value = 0;

    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text('COVERAGE'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: ((context, index) {
                    var chip = list[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ChoiceChip(
                        visualDensity: VisualDensity.comfortable,
                        backgroundColor: !chip.selected
                            ? const Color(0xff8EB14F)
                            : Colors.grey.shade200,
                        labelPadding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                        selectedShadowColor: const Color(0xff8EB14F),
                        elevation: 2,
                        label: Text(chip.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: _value == index
                                    ? Colors.black
                                    : Colors.white)),
                        selected: _value == index,
                        selectedColor: !chip.selected
                            ? const Color(0xff8EB14F)
                            : Colors.grey.shade200,
                        onSelected: (bool selected) {},
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
