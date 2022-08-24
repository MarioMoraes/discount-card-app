import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/core/widgets/custom_text_form_field.dart';
import 'package:discount_card_app/app/modules/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/widgets/button_with_loader.dart';

class LoginPage extends StatefulWidget {
  final LoginController loginController;

  const LoginPage({Key? key, required this.loginController}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _emailEC.dispose();
    _passwordEC.dispose();
  }

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
                        inputUserName(),
                        const SizedBox(height: 7),
                        inputPassword(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 50,
              right: 50,
              bottom: _height,
              child: buttonLogin(),
            ),
            Positioned(
              left: 80,
              right: 80,
              bottom: _height - 80,
              child: buttonReset(),
            ),
            Positioned(
              left: 80,
              right: 80,
              bottom: _height - 150,
              child: buttonSignUp(),
            ),
            Positioned(
                left: 20,
                right: 20,
                bottom: 10,
                child: Center(
                  child: Text(
                    "All Right Reserved. CitizensRx Inc. @${DateTime.now().year}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                )),
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
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 100),
      child: Center(
        child: Image.asset(
          'assets/images/logo-client-crx.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget title(_width) {
    return Positioned(
      top: 170,
      left: _width * 0.20,
      child: const SizedBox(
        width: 300,
        child: Text(
          'Prescription Drug\n  Discount Cards',
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
      controller: _emailEC,
    );
  }

  Widget inputPassword() {
    return CustomTextFormField(
      hint: 'Password',
      controller: _passwordEC,
      obscureText: true,
    );
  }

  Widget buttonLogin() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ButtonWithLoader<LoginController, LoginState>(
        bloc: widget.loginController,
        selector: (state) => state == LoginStatus.loading,
        onPressed: () async {
          final formValid = _formKey.currentState?.validate() ?? false;

          if (formValid) {
            Modular.to.pushNamed('/home');
          }
        },
        label: 'LOGIN',
        labelCor: Colors.white,
      ),
    );
  }

  Widget buttonSignUp() {
    return InkWell(
      onTap: () => Modular.to.pushNamed('/localization'),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white),
            color: const Color(0xFF2C4007)),
        child: const Padding(
          padding: EdgeInsets.only(top: 12.5, left: 50),
          child: Text(
            'Free Sign Up',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonReset() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white),
        color: const Color(0xFF8EB14F).withOpacity(0.3),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 12.5, left: 40),
        child: Text(
          'Reset Password',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
