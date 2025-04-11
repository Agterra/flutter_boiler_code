// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_of_service.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsOfServiceDTO _$TermsOfServiceDTOFromJson(Map<String, dynamic> json) =>
    TermsOfServiceDTO(
      id: (json['id'] as num).toInt(),
      version: (json['version'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$TermsOfServiceDTOToJson(TermsOfServiceDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'url': instance.url,
    };
