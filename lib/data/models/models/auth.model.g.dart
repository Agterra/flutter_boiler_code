// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.model.dart';

// **************************************************************************
// EntityMapperGenerator
// **************************************************************************

/// Mapper between domain an data layers
class AuthMapper {
  /// Returns a Model from a DTO
  static AuthModel modelFromDTO(AuthDTO dto) {
    final AuthModel model = AuthModel(
      tokenType: dto.tokenType,
      expiresIn: dto.expiresIn,
      accessToken: dto.accessToken,
      refreshToken: dto.refreshToken,
    );
    return model;
  }

  /// Returns a DTO from a Model
  static AuthDTO dtoFromModel(AuthModel model) {
    final AuthDTO dto = AuthDTO(
      tokenType: model.tokenType,
      expiresIn: model.expiresIn,
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
    return dto;
  }

  /// Returns a Entity from a Model
  static AuthEntity entityFromModel(AuthModel model) {
    final AuthEntity entity = AuthEntity(
      tokenType: model.tokenType,
      expiresIn: model.expiresIn,
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
    return entity;
  }

  /// Returns a Model from a Entity
  static AuthModel modelFromEntity(AuthEntity entity) {
    final AuthModel model = AuthModel(
      tokenType: entity.tokenType,
      expiresIn: entity.expiresIn,
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
    );
    return model;
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
  tokenType: json['tokenType'] as String,
  expiresIn: (json['expiresIn'] as num).toInt(),
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
  'tokenType': instance.tokenType,
  'expiresIn': instance.expiresIn,
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};
