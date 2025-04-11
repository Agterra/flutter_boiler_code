// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIDataResponse<T> _$APIDataResponseFromJson<T extends JsonSerializable>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => APIDataResponse<T>(data: fromJsonT(json['data']));

Map<String, dynamic> _$APIDataResponseToJson<T extends JsonSerializable>(
  APIDataResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{'data': toJsonT(instance.data)};
