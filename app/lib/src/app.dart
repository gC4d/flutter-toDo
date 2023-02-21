
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do/src/core/ui/theme/themes.dart';

import 'core/stores/app_store.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    Modular.setInitialRoute('/home/');
    
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: appStore.themeMode.value,
      darkTheme: darkTheme,
      theme: lightTheme,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
