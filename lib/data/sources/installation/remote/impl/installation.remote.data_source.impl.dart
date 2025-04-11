import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/data/clients/dio/endpoints/installation/installation.endpoints.dart';
import 'package:mon_app_flutter/data/clients/dio/endpoints/installation/installation.requests.dart';
import 'package:mon_app_flutter/data/clients/dio/response.dart';
import 'package:mon_app_flutter/data/models/dtos/installation.dto.dart';
import 'package:mon_app_flutter/data/models/models/installation.model.dart';
import 'package:mon_app_flutter/data/sources/installation/remote/installation.remote.data_source.dart';
import 'package:mon_app_flutter/domain/usecases/installation/create_installation.usecase.dart';
import 'package:mon_app_flutter/domain/usecases/installation/update_installation.usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'installation.remote.data_source.impl.g.dart';

class InstallationRemoteDataSourceImpl implements InstallationRemoteDataSource {
  final InstallationEndpoints _installationEndpoint;

  InstallationRemoteDataSourceImpl({
    required InstallationEndpoints installationEndpoint,
  }) : _installationEndpoint = installationEndpoint;

  @override
  Future<InstallationModel> create(CreateInstallUseCaseParams params) async {
    final CreateInstallationBody body =
        CreateInstallationBody.fromUseCaseParams(params);
    final APIDataResponse<InstallationDTO> response =
        await _installationEndpoint.createInstallation(body: body);
    final InstallationDTO installationDTO = response.data;
    return InstallationMapper.modelFromDTO(installationDTO);
  }

  @override
  Future<void> update(UpdateInstallationUseCaseParams params) async {
    final UpdateInstallationBody body =
        UpdateInstallationBody.fromUseCaseParams(params);
    await _installationEndpoint.updateInstallation(body: body);
  }
}

@riverpod
InstallationRemoteDataSourceImpl installationRemoteDataSourceImpl(Ref ref) {
  final InstallationEndpoints installationEnfpoint = ref.watch(
    installationEndpointsProvider,
  );
  return InstallationRemoteDataSourceImpl(
    installationEndpoint: installationEnfpoint,
  );
}
