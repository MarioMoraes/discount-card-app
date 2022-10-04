import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/core/widgets/card_select.dart';
import 'package:discount_card_app/app/models/chip_model.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/coverage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FilterOptionsPage extends StatefulWidget {
  const FilterOptionsPage({Key? key}) : super(key: key);

  @override
  State<FilterOptionsPage> createState() => _FilterOptionsPageState();
}

class _FilterOptionsPageState extends State<FilterOptionsPage> {
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
        children: [
          _CoverageOptions(
              coverageController: Modular.get<CoverageController>()),

          // const SizedBox(
          //   height: 15,
          // ),
          // const _TypeOptions(),
          // const SizedBox(
          //   height: 15,
          // ),
          // const _DosageOptions(),
          // const SizedBox(
          //   height: 15,
          // ),
          // const _Quantity(),
          // const SizedBox(
          //   height: 17,
          // ),
          // const _Distance(),
          // const SizedBox(
          //   height: 15,
          // ),
          // const _SourceLocation(),
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
      ChipModel(title: 'FROM DEVICE', selected: true),
      ChipModel(
          title: 'USER DEFINED', subtitle: 'Current: 123456', selected: false),
    ];

    int? _value = 0;

    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'SOURCE LOCATION',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
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
                        labelPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        selectedShadowColor: const Color(0xff8EB14F),
                        elevation: 2,
                        label: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(chip.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: chip.selected
                                      ? Colors.white
                                      : Colors.black,
                                )),
                            chip.subtitle != null
                                ? Text(chip.subtitle!)
                                : const SizedBox.shrink()
                          ],
                        ),
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

class _Distance extends StatefulWidget {
  const _Distance({Key? key}) : super(key: key);

  @override
  State<_Distance> createState() => _DistanceState();
}

class _DistanceState extends State<_Distance> {
  @override
  Widget build(BuildContext context) {
    int _value = 6;

    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'DISTANCE',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
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
                  child: Slider(
                      value: _value.toDouble(),
                      min: 5.0,
                      max: 100.0,
                      divisions: 10,
                      activeColor: context.primaryColor,
                      inactiveColor: Colors.grey,
                      onChanged: (double newValue) {
                        setState(() {
                          _value = newValue.round();
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()} miles';
                      }),
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
            child: Text(
              'QUANTITY',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 270),
          child: TextFormField(
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: context.primaryColor,
                label: const Text('1'),
                labelStyle: const TextStyle(color: Colors.white)),
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
      ChipModel(title: '300 ml', selected: true),
    ];

    int? _value = 0;

    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'DOSAGE',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
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
                Expanded(
                  child: ListView.builder(
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
                  ),
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

class _CoverageOptions extends StatefulWidget {
  final CoverageController coverageController;

  const _CoverageOptions({Key? key, required this.coverageController})
      : super(key: key);

  @override
  State<_CoverageOptions> createState() => _CoverageOptionsState();
}

class _CoverageOptionsState extends State<_CoverageOptions> {
  @override
  void initState() {
    super.initState();
    widget.coverageController.getCoverage();
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
              'COVERAGE',
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
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                BlocBuilder<CoverageController, CoverageState>(
                  bloc: widget.coverageController,
                  builder: (context, state) {
                    if (state is CoverageStateLoading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }

                    if (state is CoverageStateLoaded) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.list.length,
                        itemBuilder: ((context, index) {
                          var model = state.list[index];
                          return CardSelect(
                            controller: widget.coverageController,
                            title: model.description!,
                            selected: model.selected!,
                            index: index,
                          );
                        }),
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
