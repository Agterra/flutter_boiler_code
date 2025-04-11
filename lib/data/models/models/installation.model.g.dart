// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installation.model.dart';

// **************************************************************************
// EntityMapperGenerator
// **************************************************************************

/// Mapper between domain an data layers
class InstallationMapper {
  /// Returns a Model from a DTO
  static InstallationModel modelFromDTO(InstallationDTO dto) {
    final InstallationModel model = InstallationModel(id: dto.id);
    return model;
  }

  /// Returns a DTO from a Model
  static InstallationDTO dtoFromModel(InstallationModel model) {
    final InstallationDTO dto = InstallationDTO(id: model.id);
    return dto;
  }

  /// Returns a Entity from a Model
  static InstallationEntity entityFromModel(InstallationModel model) {
    final InstallationEntity entity = InstallationEntity(id: model.id);
    return entity;
  }

  /// Returns a Model from a Entity
  static InstallationModel modelFromEntity(InstallationEntity entity) {
    final InstallationModel model = InstallationModel(id: entity.id);
    return model;
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstallationModel _$InstallationModelFromJson(Map<String, dynamic> json) =>
    InstallationModel(id: json['id'] as String);

Map<String, dynamic> _$InstallationModelToJson(InstallationModel instance) =>
    <String, dynamic>{'id': instance.id};
