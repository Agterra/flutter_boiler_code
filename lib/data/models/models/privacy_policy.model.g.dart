// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_policy.model.dart';

// **************************************************************************
// EntityMapperGenerator
// **************************************************************************

/// Mapper between domain an data layers
class PrivacyPolicyMapper {
  /// Returns a Model from a DTO
  static PrivacyPolicyModel modelFromDTO(PrivacyPolicyDTO dto) {
    final PrivacyPolicyModel model = PrivacyPolicyModel(
      id: dto.id,
      version: dto.version,
      url: dto.url,
    );
    return model;
  }

  /// Returns a DTO from a Model
  static PrivacyPolicyDTO dtoFromModel(PrivacyPolicyModel model) {
    final PrivacyPolicyDTO dto = PrivacyPolicyDTO(
      id: model.id,
      version: model.version,
      url: model.url,
    );
    return dto;
  }

  /// Returns a Entity from a Model
  static PrivacyPolicyEntity entityFromModel(PrivacyPolicyModel model) {
    final PrivacyPolicyEntity entity = PrivacyPolicyEntity(
      id: model.id,
      version: model.version,
      url: model.url,
    );
    return entity;
  }

  /// Returns a Model from a Entity
  static PrivacyPolicyModel modelFromEntity(PrivacyPolicyEntity entity) {
    final PrivacyPolicyModel model = PrivacyPolicyModel(
      id: entity.id,
      version: entity.version,
      url: entity.url,
    );
    return model;
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacyPolicyModel _$PrivacyPolicyModelFromJson(Map<String, dynamic> json) =>
    PrivacyPolicyModel(
      id: (json['id'] as num).toInt(),
      version: (json['version'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$PrivacyPolicyModelToJson(PrivacyPolicyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'url': instance.url,
    };
