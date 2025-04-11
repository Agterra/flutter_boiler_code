// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDTO _$AuthDTOFromJson(Map<String, dynamic> json) => AuthDTO(
  tokenType: json['token_type'] as String,
  expiresIn: (json['expires_in'] as num).toInt(),
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
);

Map<String, dynamic> _$AuthDTOToJson(AuthDTO instance) => <String, dynamic>{
  'token_type': instance.tokenType,
  'expires_in': instance.expiresIn,
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
};
