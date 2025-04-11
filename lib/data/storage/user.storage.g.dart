// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.storage.dart';

// **************************************************************************
// LocalStorageGenerator
// **************************************************************************

/// Locale Storage implementation
class UserLocalStorage implements LocalStorageInterface<UserModel> {
  static String get installationPath => r'user_local_storage.db';
  final Database _database;
  final StoreRef<String, Map<String, dynamic>> _store;

  UserLocalStorage({
    required Database database,
    required StoreRef<String, Map<String, dynamic>> store,
  }) : _database = database,
       _store = store;

  @override
  Future<void> deleteAll() => _store.drop(_database);

  @override
  Future<bool> exists(String key) => _store.record(key).exists(_database);

  @override
  Future<UserModel> get(String key) async {
    final Map<String, dynamic>? result = await _store
        .record(key)
        .get(_database);
    if (result == null) throw Exception('Nothing found locally');
    return UserModel.fromJson(result);
  }

  @override
  Future<String?> remove(String key) => _store.record(key).delete(_database);

  @override
  Future<void> set(String key, UserModel value) =>
      _store.record(key).put(_database, value.toJson());
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userLocalStorageHash() => r'9a2271689b42a629d8f91b9743bca66bad83470e';

/// See also [userLocalStorage].
@ProviderFor(userLocalStorage)
final userLocalStorageProvider =
    AutoDisposeFutureProvider<UserLocalStorage>.internal(
      userLocalStorage,
      name: r'userLocalStorageProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$userLocalStorageHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserLocalStorageRef = AutoDisposeFutureProviderRef<UserLocalStorage>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
