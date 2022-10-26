import 'package:discount_card_app/app/app_module.dart';
import 'package:discount_card_app/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  SystemChannels.textInput.invokeMethod('TextInput.hide');

  await Future.delayed(const Duration(seconds: 1));

  runApp(ModularApp(
    child: const AppWidget(),
    module: AppModule(),
  ));
}
