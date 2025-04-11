import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/core/config/app_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.client.g.dart';

class DioClient extends DioForNative {
  static BaseOptions _baseOptions(String baseUrl) =>
      BaseOptions()
        ..followRedirects = true
        ..baseUrl = baseUrl
        ..connectTimeout = const Duration(seconds: 30)
        ..maxRedirects = 5
        ..contentType = Headers.formUrlEncodedContentType;

  DioClient._(String baseUrl) : super(_baseOptions(baseUrl));

  factory DioClient.basic(AppConfig appConfig) {
    return DioClient._(appConfig.baseUrl);
  }

  ///
  /// Make a new authenticated request with [options]
  ///
  Future<Response<dynamic>> authenticatedRequestWithOptions(
    RequestOptions options,
  ) {
    return request<dynamic>(
      options.path,
      queryParameters: options.queryParameters,
      data: options.data,
    );
  }
}

@Riverpod(keepAlive: true)
DioClient dioClient(Ref ref) {
  final AppConfig appConfig = ref.watch(appConfigProvider);
  return DioClient.basic(appConfig);
}
