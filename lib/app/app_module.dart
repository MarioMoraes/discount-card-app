import 'package:discount_card_app/app/core/rest/custom_dio.dart';
import 'package:discount_card_app/app/core/storage/local_storage.dart';
import 'package:discount_card_app/app/core/storage/local_storage_impl.dart';
import 'package:discount_card_app/app/modules/drug/drug_search_module.dart';
import 'package:discount_card_app/app/modules/home/home_module.dart';
import 'package:discount_card_app/app/modules/localization/localization_module.dart';
import 'package:discount_card_app/app/modules/pharmacy/pharmacy_module.dart';
import 'package:discount_card_app/app/repositories/auth/auth_repository.dart';
import 'package:discount_card_app/app/repositories/auth/auth_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/login/login_module.dart';
import 'services/auth/auth_service.dart';
import 'services/auth/auth_service_impl.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<LocalStorage>((i) => LocalStorageImpl(),
            export: true),
        Bind.lazySingleton((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
        Bind.lazySingleton<AuthService>(
            (i) => AuthServiceImpl(authRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: LoginModule(),
        ),
        ModuleRoute(
          '/localization',
          module: LocalizationModule(),
        ),
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
        ModuleRoute(
          '/drug',
          module: DrugSearchModule(),
        ),
        ModuleRoute(
          '/pharmacy',
          module: PharmacyModule(),
        ),
      ];
}
