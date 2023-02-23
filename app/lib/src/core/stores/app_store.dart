import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:to_do/src/feature/configuration/service/configuration_service.dart';
import 'package:to_do/src/feature/configuration/service/configuration_service_impl.dart';

class AppStore {
  final themeMode = RxNotifier(ThemeMode.system);
  final syncDate = RxNotifier<DateTime?>(null);

}
