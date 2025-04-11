import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:mon_app_flutter/generator/annotations.dart';
import 'package:source_gen/source_gen.dart';

class LocalStorageGenerator extends GeneratorForAnnotation<LocalStorage> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is ClassElement) {
      final String name = annotation.read('name').stringValue;
      final DartType model = annotation.read('model').typeValue;
      StringBuffer buffer =
          StringBuffer()
            ..writeln('/// Locale Storage implementation')
            ..writeln(
              'class ${name}LocalStorage implements LocalStorageInterface<$model> {',
            )
            ..writeln(
              "\tstatic String get installationPath => r'${name.toLowerCase()}_local_storage.db';",
            )
            ..writeln('\tfinal Database _database;')
            ..writeln('\tfinal StoreRef<String, Map<String, dynamic>> _store;')
            ..writeln()
            ..writeln('\t${name}LocalStorage({')
            ..writeln('\t\trequired Database database,')
            ..writeln(
              '\t\trequired StoreRef<String, Map<String, dynamic>> store,',
            )
            ..writeln('\t}) : _database = database,')
            ..writeln('\t\t\t_store = store;')
            ..writeln()
            ..writeln('\t@override')
            ..writeln('\tFuture<void> deleteAll() => _store.drop(_database);')
            ..writeln()
            ..writeln('\t@override')
            ..writeln(
              '\tFuture<bool> exists(String key) => _store.record(key).exists(_database);',
            )
            ..writeln()
            ..writeln('\t@override')
            ..writeln('\tFuture<$model> get(String key) async {')
            ..writeln('\t\tfinal Map<String, dynamic>? result = await _store')
            ..writeln('\t\t\t\t.record(key)')
            ..writeln('\t\t\t\t.get(_database);')
            ..writeln(
              "\t\tif (result == null) throw Exception('Nothing found locally');",
            )
            ..writeln('\t\treturn $model.fromJson(result);')
            ..writeln('\t}')
            ..writeln()
            ..writeln('\t@override')
            ..writeln(
              '\tFuture<String?> remove(String key) => _store.record(key).delete(_database);',
            )
            ..writeln()
            ..writeln('\t@override')
            ..writeln('\tFuture<void> set(String key, $model value) =>')
            ..writeln(
              '\t\t\t_store.record(key).put(_database, value.toJson());',
            )
            ..writeln('}')
            ..writeln();

      return buffer.toString();
    }

    return '// Not a class element';
  }
}
