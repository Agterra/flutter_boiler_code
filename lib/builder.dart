import 'package:build/build.dart';
import 'package:mon_app_flutter/generator/entity_mapper.generator.dart';
import 'package:mon_app_flutter/generator/local_storage.generator.dart';
import 'package:source_gen/source_gen.dart';

Builder entityMapperGenerator(BuilderOptions options) =>
    SharedPartBuilder(<Generator>[EntityMapperGenerator()], 'entity_mapper');

Builder localStorageGenerator(BuilderOptions options) =>
    SharedPartBuilder(<Generator>[LocalStorageGenerator()], 'local_storage');
