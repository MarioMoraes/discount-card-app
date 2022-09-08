import 'package:discount_card_app/app/modules/drug/drug_search_page.dart';
import 'package:discount_card_app/app/modules/drug/filter/filter_options_page.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/detail/pharmacy_detail_page.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/pharmacies_list_page.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/pharmacies_map_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrugSearchModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (args, context) => const DrugSearchPage(),
        ),
        ChildRoute(
          '/pharmacies-list',
          child: (args, context) => const PharmaciesListPage(),
        ),
        ChildRoute(
          '/filters',
          child: (args, context) => const FilterOptionsPage(),
          transition: TransitionType.downToUp,
          duration: const Duration(seconds: 1),
        ),
        ChildRoute(
          '/map',
          child: (args, context) => const PharmaciesMapPage(),
          transition: TransitionType.downToUp,
          duration: const Duration(seconds: 1),
        ),
        ChildRoute(
          '/details',
          child: (args, context) => const PharmacyDetailPage(),
          duration: const Duration(seconds: 1),
        ),
      ];
}
