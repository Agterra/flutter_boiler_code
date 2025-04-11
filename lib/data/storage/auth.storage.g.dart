// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.storage.dart';

// **************************************************************************
// LocalStorageGenerator
// **************************************************************************

/// Locale Storage implementation
class AuthLocalStorage implements LocalStorageInterface<AuthModel> {
  static String get installationPath => r'auth_local_storage.db';
  final Database _database;
  final StoreRef<String, Map<String, dynamic>> _store;

  AuthLocalStorage({
    required Database database,
    required StoreRef<String, Map<String, dynamic>> store,
  }) : _database = database,
       _store = store;

  @override
  Future<void> deleteAll() => _store.drop(_database);

  @override
  Future<bool> exists(String key) => _store.record(key).exists(_database);

  @override
  Future<AuthModel> get(String key) async {
    final Map<String, dynamic>? result = await _store
        .record(key)
        .get(_database);
    if (result == null) throw Exception('Nothing found locally');
    return AuthModel.fromJson(result);
  }

  @override
  Future<String?> remove(String key) => _store.record(key).delete(_database);

  @override
  Future<void> set(String key, AuthModel value) =>
      _store.record(key).put(_database, value.toJson());
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authLocalStorageHash() => r'73b7b818235f878794dcb8fd5d4b97839950f729';

/// See also [authLocalStorage].
@ProviderFor(authLocalStorage)
final authLocalStorageProvider =
    AutoDisposeFutureProvider<AuthLocalStorage>.internal(
      authLocalStorage,
      name: r'authLocalStorageProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$authLocalStorageHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthLocalStorageRef = AutoDisposeFutureProviderRef<AuthLocalStorage>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
