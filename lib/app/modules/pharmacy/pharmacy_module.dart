import 'package:discount_card_app/app/modules/pharmacy/pharmacy_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'detail/pharmacy_detail.dart';

class PharmacyModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (args, context) => PharmacyListPage(),
        ),
        ChildRoute(
          '/detail',
          child: (args, context) => const PharmacyDetail(),
        ),
      ];
}
