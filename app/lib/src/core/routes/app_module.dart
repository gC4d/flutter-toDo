import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';
import 'package:to_do/src/core/stores/app_store.dart';
import 'package:to_do/src/feature/configuration/service/configuration_service.dart';
import 'package:to_do/src/feature/configuration/service/configuration_service_impl.dart';
import 'package:to_do/src/feature/home/home_module.dart';

import '../../feature/configuration/configuration_page.dart';
import '../services/realm/realm_config.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => AppStore(ConfigurationServiceImpl(Realm(config))),
        ),
        Bind.instance<Realm>(Realm(config)),
        Bind.factory<ConfigurationService>(
          (i) => ConfigurationServiceImpl(Realm(config)),
        ),
      ];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute('/config',
            child: (context, args) => const ConfigurationPage())
      ];
}
