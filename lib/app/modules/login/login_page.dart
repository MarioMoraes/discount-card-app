import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/modules/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/widgets/button_with_loader.dart';
import '../../core/widgets/custom_text_form_field.dart';

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
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

              // Form
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.40,
                      left: 20,
                      right: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .29,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 20),
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
              ),

              _ButtonLogin(widget: widget, formKey: _formKey),
              _ButtonReset(widget: widget, formKey: _formKey),
              const _FreeSignUp(),
              const _Footter(),
            ],
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
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo-citizens.png',
      height: 100,
      fit: BoxFit.cover,
    );
  }
}

class _Footter extends StatelessWidget {
  const _Footter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height - 40,
        ),
        child: Center(
          child: Text(
            "All Right Reserved. CitizensRx Inc. @${DateTime.now().year}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _FreeSignUp extends StatelessWidget {
  const _FreeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.85,
        ),
        child: ElevatedButton(
          onPressed: () => Modular.to.pushNamed('/reset'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff2C4007),
            fixedSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Center(
            child: Text(
              'Free Sign Up',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonLogin extends StatelessWidget {
  final dynamic widget;
  final dynamic formKey;

  const _ButtonLogin({Key? key, required this.widget, required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.65,
            left: 50,
            right: 50),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ButtonWithLoader<LoginController, LoginState>(
            bloc: widget.loginController,
            selector: (state) => state == LoginStatus.loading,
            onPressed: () async {
              final formValid = formKey.currentState?.validate() ?? false;

              if (formValid) {
                Modular.to.pushNamed('/localization');
              }
            },
            label: 'LOGIN',
            labelCor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _ButtonReset extends StatelessWidget {
  final dynamic widget;
  final dynamic formKey;

  const _ButtonReset({Key? key, required this.widget, required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.75,
        ),
        child: ElevatedButton(
          onPressed: () => Modular.to.pushNamed('/reset'),
          style: ElevatedButton.styleFrom(
            backgroundColor: context.primaryColor.withOpacity(0.5),
            fixedSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Center(
            child: Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
