import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/data/models/models/installation.model.dart';
import 'package:mon_app_flutter/data/sources/installation/local/installation.local.data_source.dart';
import 'package:mon_app_flutter/data/sources/installation/remote/installation.remote.data_source.dart';
import 'package:mon_app_flutter/domain/entities/installation.entity.dart';
import 'package:mon_app_flutter/domain/repositories/installation.repository.dart';
import 'package:mon_app_flutter/domain/usecases/installation/create_installation.usecase.dart';
import 'package:mon_app_flutter/domain/usecases/installation/update_installation.usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'installation.data_repository.g.dart';

class InstallationDataRepository implements InstallationRepository {
  final InstallationLocalDataSource _installationLocalDataSource;
  final InstallationRemoteDataSource _installationremoteDataSource;

  InstallationDataRepository({
    required InstallationLocalDataSource installationLocalDataSource,
    required InstallationRemoteDataSource installationremoteDataSource,
  }) : _installationLocalDataSource = installationLocalDataSource,
       _installationremoteDataSource = installationremoteDataSource;

  @override
  Future<InstallationEntity> create(CreateInstallUseCaseParams params) async {
    final InstallationModel installationModel =
        await _installationremoteDataSource.create(params);
    return InstallationMapper.entityFromModel(installationModel);
  }

  @override
  Future<void> update(UpdateInstallationUseCaseParams params) async {
    await _installationremoteDataSource.update(params);
  }

  @override
  Future<InstallationEntity> get installation async {
    final InstallationModel model =
        await _installationLocalDataSource.installation;
    return InstallationMapper.entityFromModel(model);
  }

  @override
  Future<void> save(InstallationEntity params) async {
    final InstallationModel model = InstallationMapper.modelFromEntity(params);
    await _installationLocalDataSource.save(model);
  }

  @override
  Future<void> delete() => _installationLocalDataSource.delete();
}

@riverpod
Future<InstallationDataRepository> installationDataRepository(Ref ref) async {
  final InstallationLocalDataSource localDataSource = await ref.watch(
    installationLocalDataSourceProvider.future,
  );
  final InstallationRemoteDataSource remoteDataSource = ref.watch(
    installationRemoteDataSourceProvider,
  );

  return InstallationDataRepository(
    installationLocalDataSource: localDataSource,
    installationremoteDataSource: remoteDataSource,
  );
}
