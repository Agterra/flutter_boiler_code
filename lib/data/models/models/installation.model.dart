import 'package:json_annotation/json_annotation.dart';
import 'package:mon_app_flutter/data/models/dtos/installation.dto.dart';
import 'package:mon_app_flutter/domain/entities/installation.entity.dart';
import 'package:mon_app_flutter/generator/annotations.dart';

part 'installation.model.g.dart';

@EntityMapper(
  name: 'Installation',
  entityClass: InstallationEntity,
  dtoClass: InstallationDTO,
)
@JsonSerializable()
class InstallationModel extends JsonSerializable {
  /// Installation ID
  final String id;

  InstallationModel({required this.id});

  /// Connect the generated [_$InstallationModelFromJson] function to the `fromJson`
  /// factory.
  @override
  factory InstallationModel.fromJson(Map<String, dynamic> json) =>
      _$InstallationModelFromJson(json);

  /// Connect the generated [_$InstallationModelToJson] function to the `toJson` method.
  @override
  Map<String, dynamic> toJson() => _$InstallationModelToJson(this);
}
