import 'package:discount_card_app/app/app_module.dart';
import 'package:discount_card_app/app/app_widget.dart';
import 'package:discount_card_app/app/core/env/env.dart';
import 'package:discount_card_app/app/core/helpers/singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  await Env.instance.load();

  Singleton.instance.latitude = 41.8881604;
  Singleton.instance.longitude = -87.80669739999999;

  SystemChannels.textInput.invokeMethod('TextInput.hide');

  runApp(ModularApp(
    child: const AppWidget(),
    module: AppModule(),
  ));
}
