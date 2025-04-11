import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class APIDataResponse<T extends JsonSerializable> {
  final T data;

  APIDataResponse({required this.data});

  @override
  factory APIDataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$APIDataResponseFromJson(json, fromJsonT);
}
