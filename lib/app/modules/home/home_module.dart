import 'package:discount_card_app/app/modules/home/home_page_2.dart';
import 'package:discount_card_app/app/modules/pharmacy/pharmacy_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (args, context) => const HomePage2(),
        ),
        ModuleRoute(
          '/home/pharmacy',
          module: PharmacyModule(),
        ),
      ];
}
