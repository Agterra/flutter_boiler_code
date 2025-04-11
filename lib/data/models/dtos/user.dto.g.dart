// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
  uuid: json['uuid'] as String,
  firstname: json['firstname'] as String,
  lastname: json['lastname'] as String,
  email: json['email'] as String,
  lastLoginAt: json['lastLoginAt'] as String,
);

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
  'uuid': instance.uuid,
  'firstname': instance.firstname,
  'lastname': instance.lastname,
  'email': instance.email,
  'lastLoginAt': instance.lastLoginAt,
};
