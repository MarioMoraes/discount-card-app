import 'package:discount_card_app/app/modules/localization/controller/localization_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/widgets/custom_text_form_field.dart';

class LocalizationPage extends StatefulWidget {
  final LocalizationController bloc;

  const LocalizationPage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<LocalizationPage> createState() => _LocalizationPageState();
}

class _LocalizationPageState extends State<LocalizationPage> {
  final _formKey = GlobalKey<FormState>();

  int? _value = 5;

  final List<String> options = [
    'Sure, I’d like that',
    'Not now. Use a pre defined zipcode'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Visibility(
          visible: _value == 0 || _value == 1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              Modular.to.pushReplacementNamed('/home');
            },
            child: const Text(
              'NEXT',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                imageLocal(),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Allow Your Location',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                textAuth(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageLocal() {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Center(
        child: SizedBox(
          width: 85,
          height: 85,
          child: Image.asset(
            'assets/images/location.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget textAuth() {
    const styleText = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
    );

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text('We will use your location', style: styleText),
          const SizedBox(
            height: 5,
          ),
          const Text('to give you better', style: styleText),
          const SizedBox(
            height: 5,
          ),
          const Text('experience.', style: styleText),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ChoiceChip(
                    backgroundColor: Colors.grey.withOpacity(0.15),
                    labelPadding: const EdgeInsets.fromLTRB(30, 3, 30, 3),
                    selectedShadowColor: const Color(0xff8EB14F),
                    elevation: 2,
                    label: Text(options[index],
                        style: TextStyle(
                            color:
                                _value == index ? Colors.white : Colors.black)),
                    selected: _value == index,
                    selectedColor: const Color(0xff8EB14F),
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;
                        if (_value == 1) {
                          _showModalBottomSheet(context);
                        }
                      });
                    },
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return SizedBox(
          child: Wrap(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 20),
                      child: SizedBox(
                        height: 50,
                        child: CustomTextFormField(
                          hint: 'ZIPCODE',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            final formValid =
                                _formKey.currentState?.validate() ?? false;
                            if (formValid) {
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('CONFIRM'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
