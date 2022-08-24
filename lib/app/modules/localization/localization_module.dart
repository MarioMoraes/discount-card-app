import 'package:discount_card_app/app/modules/localization/controller/localization_state.dart';
import 'package:discount_card_app/app/modules/localization/localization_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class LocalizationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        BlocBind.lazySingleton((i) => LocalizationController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => LocalizationPage(
            bloc: Modular.get<LocalizationController>(),
          ),
        ),
      ];
}
