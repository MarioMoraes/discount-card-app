import 'package:discount_card_app/app/modules/drug/controller/drug_search_state.dart';
import 'package:discount_card_app/app/modules/drug/drug_search_page.dart';
import 'package:discount_card_app/app/modules/drug/filter/controller/filter_options_controller.dart';
import 'package:discount_card_app/app/modules/drug/filter/filter_options_page.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/detail/controller/pharmacy_detail_state.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/detail/pharmacy_detail_page.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/pharmacies_list_drug_page.dart';
import 'package:discount_card_app/app/repositories/drugs/drugs_repository.dart';
import 'package:discount_card_app/app/repositories/drugs/drugs_repository_impl.dart';
import 'package:discount_card_app/app/repositories/drugs/filter/filter_repository.dart';
import 'package:discount_card_app/app/repositories/drugs/filter/filter_repository_impl.dart';
import 'package:discount_card_app/app/repositories/pharmacy/pharmacy_info_repository.dart';
import 'package:discount_card_app/app/repositories/pharmacy/pharmacy_info_repository_impl.dart';
import 'package:discount_card_app/app/repositories/prices/pharmacy_and_price_repository.dart';
import 'package:discount_card_app/app/repositories/prices/pharmacy_and_price_repository_impl.dart';
import 'package:discount_card_app/app/services/drugs/drugs_service.dart';
import 'package:discount_card_app/app/services/drugs/drugs_service_impl.dart';
import 'package:discount_card_app/app/services/drugs/filter/filter_service.dart';
import 'package:discount_card_app/app/services/drugs/filter/filter_service_impl.dart';
import 'package:discount_card_app/app/services/pharmacy/pharmacy_info_service.dart';
import 'package:discount_card_app/app/services/pharmacy/pharmacy_info_service_impl.dart';
import 'package:discount_card_app/app/services/prices/pharmacy_and_price_service.dart';
import 'package:discount_card_app/app/services/prices/pharmacy_and_price_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'pharmacies/controller/pharmacy_list_state.dart';
import 'pharmacies/pharmacies_map_page.dart';

class DrugSearchModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Drugs
        Bind.lazySingleton<DrugsRepository>(
            (i) => DrugsRepositoryImpl(dio: i())),
        Bind.lazySingleton<DrugsService>(
            (i) => DrugsServiceImpl(drugsRepository: i())),
        BlocBind.lazySingleton((i) => DrugSearchController(drugsService: i())),

        // Pharmacy Details
        Bind.lazySingleton<PharmacyInfoRepository>(
            (i) => PharmacyInfoRepositoryImpl(dio: i())),
        Bind.lazySingleton<PharmacyInfoService>(
            (i) => PharmacyInfoServiceImpl(repository: i())),
        BlocBind.lazySingleton((i) => PharmacyDetailController(service: i())),

        // Pharmacies And Prices
        Bind.lazySingleton<PharmacyAndPriceRepository>(
            (i) => PharmacyAndPriceRepositoryImpl(dio: i())),
        Bind.lazySingleton<PharmacyAndPriceService>(
            (i) => PharmacyAndPriceServiceImpl(repository: i())),
        BlocBind.lazySingleton((i) => PharmacyListController(service: i())),

        // Filters
        Bind.lazySingleton<FilterRepository>(
            (i) => FilterRepositoryImpl(dio: i())),
        Bind.lazySingleton<FilterService>(
            (i) => FilterServiceImpl(filterRepository: i())),
        BlocBind.lazySingleton((i) => FilterOptionsController(service: i())),
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
            controller: Modular.get<PharmacyListController>(),
            model: args.data,
          ),
        ),
        ChildRoute(
          '/filters',
          child: (args, context) => FilterOptionsPage(
              controller: Modular.get<FilterOptionsController>()),
          transition: TransitionType.downToUp,
        ),
        ChildRoute(
          '/map',
          child: (_, args) => PharmaciesMapPage(list: args.data),
          duration: const Duration(seconds: 1),
        ),
        ChildRoute(
          '/details',
          child: (_, args) => PharmacyDetailPage(
            controller: Modular.get<PharmacyDetailController>(),
            model: args.data,
          ),
          duration: const Duration(seconds: 1),
        ),
      ];
}
