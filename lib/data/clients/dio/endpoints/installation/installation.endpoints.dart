import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/data/clients/dio/dio.client.dart';
import 'package:mon_app_flutter/data/clients/dio/endpoints/installation/installation.requests.dart';
import 'package:mon_app_flutter/data/clients/dio/response.dart';
import 'package:mon_app_flutter/data/models/dtos/installation.dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'installation.endpoints.g.dart';

@RestApi()
abstract class InstallationEndpoints {
  factory InstallationEndpoints(DioClient dioClient) = _InstallationEndpoints;

  @POST('/installations')
  Future<APIDataResponse<InstallationDTO>> createInstallation({
    @Body() required CreateInstallationBody body,
  });

  @PUT('/installations/:installation')
  Future<void> updateInstallation({
    @Body() required UpdateInstallationBody body,
  });
}

@riverpod
InstallationEndpoints installationEndpoints(Ref ref) {
  final DioClient dioClient = ref.watch(dioClientProvider);
  return InstallationEndpoints(dioClient);
}
