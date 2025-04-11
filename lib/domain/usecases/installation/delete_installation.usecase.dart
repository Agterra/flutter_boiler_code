import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/data/repositories/installation.data_repository.dart';
import 'package:mon_app_flutter/domain/repositories/installation.repository.dart';
import 'package:mon_app_flutter/domain/usecases/future.usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_installation.usecase.g.dart';

class DeleteInstallationUseCase extends FutureUseCase<void> {
  final InstallationRepository _installationRepository;

  DeleteInstallationUseCase({
    required InstallationRepository installationRepository,
  }) : _installationRepository = installationRepository;

  @override
  Future<void> invoke() {
    return _installationRepository.delete();
  }
}

@riverpod
Future<DeleteInstallationUseCase> deleteInstallationUseCase(Ref ref) async {
  final InstallationRepository installationRepository = await ref.watch(
    installationDataRepositoryProvider.future,
  );

  return DeleteInstallationUseCase(
    installationRepository: installationRepository,
  );
}
