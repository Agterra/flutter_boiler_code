import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/data/repositories/installation.data_repository.dart';
import 'package:mon_app_flutter/domain/entities/installation.entity.dart';
import 'package:mon_app_flutter/domain/repositories/installation.repository.dart';
import 'package:mon_app_flutter/domain/usecases/future.usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_installation.usecase.g.dart';

class GetInstallationUseCase extends FutureUseCase<InstallationEntity> {
  final InstallationRepository _installationRepository;

  GetInstallationUseCase({
    required InstallationRepository installationRepository,
  }) : _installationRepository = installationRepository;

  @override
  Future<InstallationEntity> invoke() {
    return _installationRepository.installation;
  }
}

@riverpod
Future<GetInstallationUseCase> getInstallationUseCase(Ref ref) async {
  final InstallationDataRepository installationRepository = await ref.watch(
    installationDataRepositoryProvider.future,
  );

  return GetInstallationUseCase(installationRepository: installationRepository);
}
