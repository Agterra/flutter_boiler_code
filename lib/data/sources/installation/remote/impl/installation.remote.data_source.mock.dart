import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/data/models/models/installation.model.dart';
import 'package:mon_app_flutter/data/sources/installation/remote/installation.remote.data_source.dart';
import 'package:mon_app_flutter/domain/usecases/installation/create_installation.usecase.dart';
import 'package:mon_app_flutter/domain/usecases/installation/update_installation.usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'installation.remote.data_source.mock.g.dart';

class InstallationRemoteDataSourceMock implements InstallationRemoteDataSource {
  @override
  Future<InstallationModel> create(CreateInstallUseCaseParams params) async {
    final InstallationModel installationModel = InstallationModel(
      id: '35fe6990-5f56-${Random().nextInt(9999).toString()}-803c-defb4a325c48',
    );
    return installationModel;
  }

  @override
  Future<void> update(UpdateInstallationUseCaseParams params) async {
    return;
  }
}

@riverpod
InstallationRemoteDataSourceMock installationRemoteDataSourceMock(Ref ref) {
  return InstallationRemoteDataSourceMock();
}
