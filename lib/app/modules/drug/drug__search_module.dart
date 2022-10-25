import 'package:discount_card_app/app/modules/drug/drug_search_page.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/coverage_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/dosage_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/quantity_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/type_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/filter_options_page.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/detail/pharmacy_detail_page.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/pharmacies_list_drug_page.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/pharmacies_map_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class DrugSearchModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        BlocBind.lazySingleton((i) => CoverageController()),
        BlocBind.lazySingleton((i) => TypeController()),
        BlocBind.lazySingleton((i) => DosageController()),
        BlocBind.lazySingleton((i) => QuantityController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (args, context) => const DrugSearchPage(),
        ),
        ChildRoute(
          '/pharmacies-list',
          child: (args, context) => const PharmaciesListDrugPage(),
        ),
        ChildRoute(
          '/filters',
          child: (args, context) => const FilterOptionsPage(),
          transition: TransitionType.downToUp,
        ),
        ChildRoute(
          '/map',
          child: (args, context) => const PharmaciesMapPage(),
          duration: const Duration(seconds: 1),
        ),
        ChildRoute(
          '/details',
          child: (args, context) => const PharmacyDetailPage(),
          duration: const Duration(seconds: 1),
        ),
      ];
}
