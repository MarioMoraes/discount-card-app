import 'package:discount_card_app/app/modules/drug/controller/drug_search_state.dart';
import 'package:discount_card_app/app/modules/drug/drug_search_page.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/coverage_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/distance_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/dosage_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/quantity_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/type_state.dart';
import 'package:discount_card_app/app/modules/drug/filter/filter_options_page.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/detail/controller/pharmacy_detail_state.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/detail/pharmacy_detail_page.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/pharmacies_list_drug_page.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/pharmacies_map_page.dart';
import 'package:discount_card_app/app/repositories/drugs/drugs_repository.dart';
import 'package:discount_card_app/app/repositories/drugs/drugs_repository_impl.dart';
import 'package:discount_card_app/app/repositories/prices/pharmacy_and_price_repository.dart';
import 'package:discount_card_app/app/repositories/prices/pharmacy_and_price_repository_impl.dart';
import 'package:discount_card_app/app/services/drugs/drugs_service.dart';
import 'package:discount_card_app/app/services/drugs/drugs_service_impl.dart';
import 'package:discount_card_app/app/services/prices/pharmacy_and_price_service.dart';
import 'package:discount_card_app/app/services/prices/pharmacy_and_price_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class DrugSearchModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Filters
        BlocBind.lazySingleton((i) => CoverageController()),
        BlocBind.lazySingleton((i) => TypeController()),
        BlocBind.lazySingleton((i) => DosageController()),
        BlocBind.lazySingleton((i) => QuantityController()),
        BlocBind.lazySingleton((i) => DistanceController()),

        // Drugs
        Bind.lazySingleton<DrugsRepository>(
            (i) => DrugsRepositoryImpl(dio: i())),
        Bind.lazySingleton<DrugsService>(
            (i) => DrugsServiceImpl(drugsRepository: i())),
        BlocBind.lazySingleton((i) => DrugSearchController(drugsService: i())),

        // Pharmacies And Prices
        Bind.lazySingleton<PharmacyAndPriceRepository>(
            (i) => PharmacyAndPriceRepositoryImpl(dio: i())),
        Bind.lazySingleton<PharmacyAndPriceService>(
            (i) => PharmacyAndPriceServiceImpl(repository: i())),
        BlocBind.lazySingleton((i) => PharmacyDetailController(service: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (args, context) =>
              DrugSearchPage(controller: Modular.get<DrugSearchController>()),
        ),
        ChildRoute(
          '/pharmacies-list',
          child: (_, args) => PharmaciesListDrugPage(
            controller: Modular.get<PharmacyDetailController>(),
            model: args.data,
          ),
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
