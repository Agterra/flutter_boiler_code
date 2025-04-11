import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/data/repositories/installation.data_repository.dart';
import 'package:mon_app_flutter/domain/entities/installation.entity.dart';
import 'package:mon_app_flutter/domain/repositories/installation.repository.dart';
import 'package:mon_app_flutter/domain/usecases/future.usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_installation.usecase.g.dart';

class SaveInstallationUseCase
    extends FutureUseCaseWithParams<void, InstallationEntity> {
  final InstallationRepository _installationRepository;

  SaveInstallationUseCase({
    required InstallationRepository installationRepository,
  }) : _installationRepository = installationRepository;

  @override
  Future<void> invoke(InstallationEntity params) =>
      _installationRepository.save(params);
}

@riverpod
Future<SaveInstallationUseCase> saveInstallationUseCase(Ref ref) async {
  final InstallationRepository installationRepository = await ref.watch(
    installationDataRepositoryProvider.future,
  );

  return SaveInstallationUseCase(
    installationRepository: installationRepository,
  );
}
