// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:realm/realm.dart';
import 'package:to_do/src/core/services/realm/models/configuration_model.dart';

import './configuration_service.dart';

class ConfigurationServiceImpl implements ConfigurationService {
  final Realm realm;
  const ConfigurationServiceImpl(this.realm);

  @override
  void deleteAll() {}

  @override
  ConfigurationModel getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  @override
  void saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = getConfiguration();
    realm.write(() {
      model
        ..themeModeName = themeModeName
        ..syncDate = syncDate;
    });
  }
}
