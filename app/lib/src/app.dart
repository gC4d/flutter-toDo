
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:to_do/src/core/ui/theme/themes.dart';
import 'package:to_do/src/feature/configuration/service/configuration_service.dart';

import 'core/stores/app_store.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final config = Modular.get<ConfigurationService>();
  final appStore = Modular.get<AppStore>();

  @override
  void initState() {
    super.initState();
    config.init();
  }

  @override
  Widget build(BuildContext context) {

    Modular.setInitialRoute('/home/');
    
   final themeMode = context.select(() => appStore.themeMode.value);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      darkTheme: darkTheme,
      theme: lightTheme,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
