import 'package:meta/meta_meta.dart';

/// We specify entity and dto class so
/// we do not forget to import them in main class

/// EntityMapper
@Target(<TargetKind>{TargetKind.classType})
class EntityMapper {
  final String name;
  final Type entityClass;
  final Type dtoClass;
  const EntityMapper({
    required this.name,
    required this.entityClass,
    required this.dtoClass,
  });
}

/// LocalStorage
@Target(<TargetKind>{TargetKind.classType})
class LocalStorage {
  final String name;
  final Type model;

  const LocalStorage({required this.name, required this.model});
}
