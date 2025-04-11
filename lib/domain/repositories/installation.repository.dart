import 'package:mon_app_flutter/domain/entities/installation.entity.dart';
import 'package:mon_app_flutter/domain/usecases/installation/create_installation.usecase.dart';
import 'package:mon_app_flutter/domain/usecases/installation/update_installation.usecase.dart';

abstract class InstallationRepository {
  Future<InstallationEntity> create(CreateInstallUseCaseParams params);
  Future<void> save(InstallationEntity params);
  Future<void> delete();
  Future<void> update(UpdateInstallationUseCaseParams params);
  Future<InstallationEntity> get installation;
}
