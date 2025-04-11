// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.data_model.dart';

// **************************************************************************
// EntityMapperGenerator
// **************************************************************************

/// Mapper between domain an data layers
class UserMapper {
  /// Returns a Model from a DTO
  static UserModel modelFromDTO(UserDTO dto) {
    final UserModel model = UserModel(
      uuid: dto.uuid,
      firstname: dto.firstname,
      lastname: dto.lastname,
      email: dto.email,
      lastLoginAt: dto.lastLoginAt,
    );
    return model;
  }

  /// Returns a DTO from a Model
  static UserDTO dtoFromModel(UserModel model) {
    final UserDTO dto = UserDTO(
      uuid: model.uuid,
      firstname: model.firstname,
      lastname: model.lastname,
      email: model.email,
      lastLoginAt: model.lastLoginAt,
    );
    return dto;
  }

  /// Returns a Entity from a Model
  static UserEntity entityFromModel(UserModel model) {
    final UserEntity entity = UserEntity(
      uuid: model.uuid,
      firstname: model.firstname,
      lastname: model.lastname,
      email: model.email,
      lastLoginAt: model.lastLoginAt,
    );
    return entity;
  }

  /// Returns a Model from a Entity
  static UserModel modelFromEntity(UserEntity entity) {
    final UserModel model = UserModel(
      uuid: entity.uuid,
      firstname: entity.firstname,
      lastname: entity.lastname,
      email: entity.email,
      lastLoginAt: entity.lastLoginAt,
    );
    return model;
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  uuid: json['uuid'] as String,
  firstname: json['firstname'] as String,
  lastname: json['lastname'] as String,
  email: json['email'] as String,
  lastLoginAt: json['lastLoginAt'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'uuid': instance.uuid,
  'firstname': instance.firstname,
  'lastname': instance.lastname,
  'email': instance.email,
  'lastLoginAt': instance.lastLoginAt,
};
