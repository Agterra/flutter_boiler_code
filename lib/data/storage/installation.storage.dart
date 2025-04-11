import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/data/models/models/installation.model.dart';
import 'package:mon_app_flutter/data/storage/interface.dart';
import 'package:mon_app_flutter/data/utils/database.dart';
import 'package:mon_app_flutter/generator/annotations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast_io.dart';

part 'installation.storage.g.dart';

@LocalStorage(name: 'Installation', model: InstallationModel)
abstract class InstallationLocalStorageInterface
    implements LocalStorageInterface<InstallationModel> {}

@riverpod
Future<InstallationLocalStorage> installationLocalStorage(Ref ref) async {
  final StoreRef<String, Map<String, dynamic>> store =
      StoreRef<String, Map<String, dynamic>>.main();
  final Database database = await createLocalDatabase(
    installationPath: InstallationLocalStorage.installationPath,
  );
  return InstallationLocalStorage(database: database, store: store);
}
