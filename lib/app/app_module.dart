import 'package:discount_card_app/app/modules/drug/drug__search_module.dart';
import 'package:discount_card_app/app/modules/home/home_module.dart';
import 'package:discount_card_app/app/modules/localization/localization_module.dart';
import 'package:discount_card_app/app/repositories/auth/auth_repository.dart';
import 'package:discount_card_app/app/repositories/auth/auth_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/login/login_module.dart';
import 'services/auth/auth_service.dart';
import 'services/auth/auth_service_impl.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl()),
        Bind.lazySingleton<AuthService>(
            (i) => AuthServiceImpl(authRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: LoginModule(),
          transition: TransitionType.leftToRight,
        ),
        ModuleRoute(
          '/localization',
          module: LocalizationModule(),
          transition: TransitionType.leftToRight,
        ),
        ModuleRoute(
          '/home',
          module: HomeModule(),
          transition: TransitionType.leftToRight,
        ),
        ModuleRoute(
          '/drug',
          module: DrugSearchModule(),
          transition: TransitionType.leftToRight,
        ),
      ];
}
