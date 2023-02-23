import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:to_do/src/core/stores/app_store.dart';
import 'package:to_do/src/core/ui/widgets/to_do_app_bar.dart';
import 'package:to_do/src/core/ui/widgets/user_image_button.dart';

class ConfigurationPage extends StatelessWidget {
  ConfigurationPage({super.key});

  final appStore = Modular.get<AppStore>();

  void _changeThemeMode(ThemeMode? themeMode){
    if(themeMode != null){
      appStore.themeMode.value = themeMode;  
    }

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    context.select(() => appStore.themeMode.value);

    return Scaffold(
      appBar: ToDoAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Configurações',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Tema',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              RadioListTile<ThemeMode>(
                value: ThemeMode.system,
                groupValue: appStore.themeMode.value,
                title: const Text('Sistema'),
                onChanged: _changeThemeMode,
              ),
              RadioListTile<ThemeMode>(
                value: ThemeMode.light,
                groupValue: appStore.themeMode.value,
                title: const Text('Claro'),
                onChanged: _changeThemeMode,
              ),
              RadioListTile<ThemeMode>(
                value: ThemeMode.dark,
                groupValue: appStore.themeMode.value,
                title: const Text('Escuro'),
                onChanged: _changeThemeMode,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Controle de dados',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Apagar cache e reiniciar o app'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
