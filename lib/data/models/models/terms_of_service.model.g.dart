// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_of_service.model.dart';

// **************************************************************************
// EntityMapperGenerator
// **************************************************************************

/// Mapper between domain an data layers
class TermsOfServiceMapper {
  /// Returns a Model from a DTO
  static TermsOfServiceModel modelFromDTO(TermsOfServiceDTO dto) {
    final TermsOfServiceModel model = TermsOfServiceModel(
      id: dto.id,
      version: dto.version,
      url: dto.url,
    );
    return model;
  }

  /// Returns a DTO from a Model
  static TermsOfServiceDTO dtoFromModel(TermsOfServiceModel model) {
    final TermsOfServiceDTO dto = TermsOfServiceDTO(
      id: model.id,
      version: model.version,
      url: model.url,
    );
    return dto;
  }

  /// Returns a Entity from a Model
  static TermsOfServiceEntity entityFromModel(TermsOfServiceModel model) {
    final TermsOfServiceEntity entity = TermsOfServiceEntity(
      id: model.id,
      version: model.version,
      url: model.url,
    );
    return entity;
  }

  /// Returns a Model from a Entity
  static TermsOfServiceModel modelFromEntity(TermsOfServiceEntity entity) {
    final TermsOfServiceModel model = TermsOfServiceModel(
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

TermsOfServiceModel _$TermsOfServiceModelFromJson(Map<String, dynamic> json) =>
    TermsOfServiceModel(
      id: (json['id'] as num).toInt(),
      version: (json['version'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$TermsOfServiceModelToJson(
  TermsOfServiceModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'version': instance.version,
  'url': instance.url,
};
