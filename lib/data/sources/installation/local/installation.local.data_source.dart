import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/data/models/models/installation.model.dart';
import 'package:mon_app_flutter/data/storage/installation.storage.dart';
import 'package:mon_app_flutter/data/storage/interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'installation.local.data_source.g.dart';

class InstallationLocalDataSource {
  final LocalStorageInterface<InstallationModel> _installationLocalStorage;

  InstallationLocalDataSource({
    required LocalStorageInterface<InstallationModel> installationLocalStorage,
  }) : _installationLocalStorage = installationLocalStorage;

  Future<InstallationModel> get installation =>
      _installationLocalStorage.get('installation');

  Future<void> save(InstallationModel installation) {
    return _installationLocalStorage.set('installation', installation);
  }

  Future<void> delete() => _installationLocalStorage.deleteAll();
}

@riverpod
Future<InstallationLocalDataSource> installationLocalDataSource(Ref ref) async {
  final InstallationLocalStorage installationLocalStorage = await ref.watch(
    installationLocalStorageProvider.future,
  );
  return InstallationLocalDataSource(
    installationLocalStorage: installationLocalStorage,
  );
}
