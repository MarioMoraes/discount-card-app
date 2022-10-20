import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/widgets/custom_text_form_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _height = (MediaQuery.of(context).size.height / 2) * .60;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fundo-citizens.jpg'),
              fit: BoxFit.cover,
              opacity: 0.8,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08),
                  child: const _Logo(),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25),
                  child: const Text(
                    'Prescription Drug\n  Discount Cards',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: MediaQuery.of(context).size.height * .4),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .29,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            SizedBox(
                              width: 300,
                              height: 50,
                              child: Text(
                                'Enter your email for reset password. An email should be sended in your Mailbox.',
                                style: TextStyle(color: Colors.grey.shade600),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            const SizedBox(height: 7),
                            inputUserName(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .65),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: buttonReset(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .75),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: buttonCancel(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputUserName() {
    return CustomTextFormField(
      hint: 'Email',
    );
  }

  Widget buttonReset() {
    return ElevatedButton(
      onPressed: () {
        const snackBar = SnackBar(
          content: Text('Email Sent'),
          backgroundColor: (Colors.black12),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.primaryColor,
        fixedSize: const Size(80, 50),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Center(
        child: Text(
          'SEND',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buttonCancel() {
    return ElevatedButton(
      onPressed: () => Modular.to.pop(),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff2C4007),
        fixedSize: const Size(80, 50),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Center(
        child: Text(
          'BACK',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo_citizensrx_0.5x.png',
      height: 100,
      fit: BoxFit.cover,
    );
  }
}
