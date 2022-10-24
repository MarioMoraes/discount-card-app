import 'package:discount_card_app/app/core/widgets/card_select.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/coverage_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/type_state.dart';
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
          const SizedBox(
            height: 15,
          ),
          __TypeOptions(typeController: Modular.get<TypeController>()),

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

class __TypeOptions extends StatefulWidget {
  final TypeController typeController;

  const __TypeOptions({Key? key, required this.typeController})
      : super(key: key);

  @override
  State<__TypeOptions> createState() => __TypeOptionsState();
}

class __TypeOptionsState extends State<__TypeOptions> {
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
