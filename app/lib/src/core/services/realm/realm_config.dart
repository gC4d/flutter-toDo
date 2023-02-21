import 'package:realm/realm.dart';
import 'package:to_do/src/core/services/realm/models/configuration_model.dart';
import 'package:to_do/src/core/services/realm/models/task_model.dart';

LocalConfiguration config = Configuration.local(
  [
    ConfigurationModel.schema,
    ///taskBoard.schema,
    //Task.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(ConfigurationModel('system'));
  },
  schemaVersion: 2,
);
