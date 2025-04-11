// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installation.requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateInstallationBody _$CreateInstallationBodyFromJson(
  Map<String, dynamic> json,
) => CreateInstallationBody(
  appId: json['app_id'] as String,
  appVersion: json['app_version'] as String,
  deviceType: json['device_type'] as String,
  locale: json['locale'] as String,
  timezone: json['timezone'] as String,
  osVersion: json['os_version'] as String,
  deviceBrand: json['device_brand'] as String,
);

Map<String, dynamic> _$CreateInstallationBodyToJson(
  CreateInstallationBody instance,
) => <String, dynamic>{
  'app_id': instance.appId,
  'app_version': instance.appVersion,
  'device_type': instance.deviceType,
  'locale': instance.locale,
  'timezone': instance.timezone,
  'os_version': instance.osVersion,
  'device_brand': instance.deviceBrand,
};
