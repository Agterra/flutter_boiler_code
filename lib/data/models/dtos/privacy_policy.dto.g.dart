// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_policy.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivacyPolicyDTO _$PrivacyPolicyDTOFromJson(Map<String, dynamic> json) =>
    PrivacyPolicyDTO(
      id: (json['id'] as num).toInt(),
      version: (json['version'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$PrivacyPolicyDTOToJson(PrivacyPolicyDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'url': instance.url,
    };
