import 'package:discount_card_app/app/modules/localization/localization_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LocalizationModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const LocalizationPage()),
      ];
}
