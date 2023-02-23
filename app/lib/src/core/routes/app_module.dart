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
        AutoBind.singleton(AppStore.new),
        AutoBind.instance<Realm>(Realm(config)),
        AutoBind.singleton<ConfigurationService>(ConfigurationServiceImpl.new),
      ];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute('/config', child: (context, args) => ConfigurationPage())
      ];
}
