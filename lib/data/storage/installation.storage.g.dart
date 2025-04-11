// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installation.storage.dart';

// **************************************************************************
// LocalStorageGenerator
// **************************************************************************

/// Locale Storage implementation
class InstallationLocalStorage
    implements LocalStorageInterface<InstallationModel> {
  static String get installationPath => r'installation_local_storage.db';
  final Database _database;
  final StoreRef<String, Map<String, dynamic>> _store;

  InstallationLocalStorage({
    required Database database,
    required StoreRef<String, Map<String, dynamic>> store,
  }) : _database = database,
       _store = store;

  @override
  Future<void> deleteAll() => _store.drop(_database);

  @override
  Future<bool> exists(String key) => _store.record(key).exists(_database);

  @override
  Future<InstallationModel> get(String key) async {
    final Map<String, dynamic>? result = await _store
        .record(key)
        .get(_database);
    if (result == null) throw Exception('Nothing found locally');
    return InstallationModel.fromJson(result);
  }

  @override
  Future<String?> remove(String key) => _store.record(key).delete(_database);

  @override
  Future<void> set(String key, InstallationModel value) =>
      _store.record(key).put(_database, value.toJson());
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$installationLocalStorageHash() =>
    r'6e708b2b9c7fd87f5cd54b001704d1e7ef967def';

/// See also [installationLocalStorage].
@ProviderFor(installationLocalStorage)
final installationLocalStorageProvider =
    AutoDisposeFutureProvider<InstallationLocalStorage>.internal(
      installationLocalStorage,
      name: r'installationLocalStorageProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$installationLocalStorageHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InstallationLocalStorageRef =
    AutoDisposeFutureProviderRef<InstallationLocalStorage>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
