import 'package:json_annotation/json_annotation.dart';

/// Storage interface for local storage
abstract class LocalStorageInterface<T extends JsonSerializable> {
  /// Get value from key
  Future<T> get(String key);

  /// Set value with key, returns the created or updated model
  Future<void> set(String key, T value);

  /// Remove value with key. Return the key if deleted, null otherwise
  Future<String?> remove(String key);

  /// Check if a value exists for key
  Future<bool> exists(String key);

  /// Delete all
  Future<void> deleteAll();
}
