import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mon_app_flutter/generator/annotations.dart';
import 'package:source_gen/source_gen.dart';

// ignore: constant_identifier_names
enum _ClassName { DTO, Model, Entity }

class EntityMapperGenerator extends GeneratorForAnnotation<EntityMapper> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is ClassElement) {
      final ClassElement classElement = element;
      final List<FieldElement> fields = classElement.fields;
      final String name = annotation.read('name').stringValue;

      final StringBuffer buffer =
          StringBuffer()
            ..writeln('/// Mapper between domain an data layers')
            ..writeln('class ${name}Mapper {');

      _writeToBuffer(
        className: name,
        sourceClass: _ClassName.DTO.name,
        destClass: _ClassName.Model.name,
        buffer: buffer,
        fields: fields,
      );

      _writeToBuffer(
        className: name,
        sourceClass: _ClassName.Model.name,
        destClass: _ClassName.DTO.name,
        buffer: buffer,
        fields: fields,
      );

      _writeToBuffer(
        className: name,
        sourceClass: _ClassName.Model.name,
        destClass: _ClassName.Entity.name,
        buffer: buffer,
        fields: fields,
      );

      _writeToBuffer(
        className: name,
        sourceClass: _ClassName.Entity.name,
        destClass: _ClassName.Model.name,
        buffer: buffer,
        fields: fields,
      );

      buffer.writeln('}');

      return buffer.toString();
    } else {
      return '// Not a class element';
    }
  }
}

void _writeToBuffer({
  required String className,
  required String sourceClass,
  required String destClass,
  required StringBuffer buffer,
  required List<FieldElement> fields,
}) {
  buffer
    ..writeln('\t/// Returns a $destClass from a $sourceClass')
    ..writeln(
      '\tstatic $className$destClass ${destClass.toLowerCase()}From$sourceClass($className$sourceClass ${sourceClass.toLowerCase()}) {',
    )
    ..writeln(
      '\t\tfinal $className$destClass ${destClass.toLowerCase()} = $className$destClass(',
    );
  for (final FieldElement field in fields) {
    buffer.writeln(
      '\t\t\t${field.name}: ${sourceClass.toLowerCase()}.${field.name},',
    );
  }

  buffer
    ..writeln('\t\t);')
    ..writeln('\t\treturn ${destClass.toLowerCase()};')
    ..writeln('\t}');
}
