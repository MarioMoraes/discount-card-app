import 'package:discount_card_app/app/modules/pharmacy/controller/pharmacy_state.dart';
import 'package:discount_card_app/app/modules/pharmacy/pharmacy_list_page.dart';
import 'package:discount_card_app/app/repositories/pharmacy/pharmacy_list/pharmacy_repository.dart';
import 'package:discount_card_app/app/repositories/pharmacy/pharmacy_list/pharmacy_repository_impl.dart';
import 'package:discount_card_app/app/services/pharmacy/pharmacy_list/pharmacy_list_service.dart';
import 'package:discount_card_app/app/services/pharmacy/pharmacy_list/pharmacy_list_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'detail/pharmacy_detail.dart';

class PharmacyModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Drugs
        Bind.lazySingleton<PharmacyRepository>(
            (i) => PharmacyRepositoryImpl(dio: i())),
        Bind.lazySingleton<PharmacyListService>(
            (i) => PharmacyListServiceImpl(repository: i())),
        BlocBind.lazySingleton((i) => PharmacyController(service: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (args, context) =>
              PharmacyListPage(controller: Modular.get<PharmacyController>()),
        ),
        ChildRoute(
          '/detail',
          child: (_, args) => PharmacyDetail(model: args.data),
        ),
      ];
}
