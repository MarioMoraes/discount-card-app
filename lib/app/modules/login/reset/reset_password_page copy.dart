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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            wallpaper(),
            logo(),
            title(_width),
            Padding(
              padding: EdgeInsets.fromLTRB(20, _height + 50, 20, 20),
              child: Container(
                height: MediaQuery.of(context).size.height * .29,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 20),
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
            Positioned(
              left: 80,
              right: 80,
              bottom: _height,
              child: buttonReset(),
            ),
            Positioned(
              left: 80,
              right: 80,
              bottom: _height - 80,
              child: buttonCancel(),
            ),
          ],
        ),
      ),
    );
  }

  Widget wallpaper() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [context.primaryColor, Colors.white],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Opacity(
        opacity: 0.6,
        child: Image.asset(
          'assets/images/fundo-citizens.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget logo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 100),
      child: Center(
        child: Image.asset(
          'assets/images/logo_citizensrx_0.5x.png',
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget title(_width) {
    return Positioned(
      top: 185,
      left: _width * 0.20,
      child: const SizedBox(
        width: 300,
        child: Text(
          'Reset Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
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
