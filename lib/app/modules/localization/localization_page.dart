import 'package:discount_card_app/app/core/widgets/button_state.dart';
import 'package:flutter/material.dart';

class LocalizationPage extends StatelessWidget {
  const LocalizationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            height: 40,
          ),
          ButtonState(hint: 'Sure, I’d like that', onOff: true),
          const SizedBox(
            height: 20,
          ),
          ButtonState(hint: 'Not now. Use a pre defined zipcode'),
        ],
      ),
    );
  }
}
