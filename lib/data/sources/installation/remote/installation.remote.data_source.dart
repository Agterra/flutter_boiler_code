import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/core/providers/environment.dart';
import 'package:mon_app_flutter/data/models/models/installation.model.dart';
import 'package:mon_app_flutter/data/sources/installation/remote/impl/installation.remote.data_source.impl.dart';
import 'package:mon_app_flutter/data/sources/installation/remote/impl/installation.remote.data_source.mock.dart';
import 'package:mon_app_flutter/domain/usecases/installation/create_installation.usecase.dart';
import 'package:mon_app_flutter/domain/usecases/installation/update_installation.usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'installation.remote.data_source.g.dart';

abstract class InstallationRemoteDataSource {
  Future<InstallationModel> create(CreateInstallUseCaseParams params);
  Future<void> update(UpdateInstallationUseCaseParams params);
}

@riverpod
InstallationRemoteDataSource installationRemoteDataSource(Ref ref) {
  final Environment env = ref.watch(envProvider);
  switch (env) {
    case Environment.mock:
      return ref.watch(installationRemoteDataSourceMockProvider);
    default:
      return ref.watch(installationRemoteDataSourceImplProvider);
  }
}
