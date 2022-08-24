import 'package:discount_card_app/app/modules/drug/drug_search_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrugSearchModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (args, context) => const DrugSearchPage()),
      ];
}
