import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/data/repositories/installation.data_repository.dart';
import 'package:mon_app_flutter/domain/repositories/installation.repository.dart';
import 'package:mon_app_flutter/domain/usecases/future.usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_installation.usecase.g.dart';

class UpdateInstallationUseCase
    extends FutureUseCaseWithParams<void, UpdateInstallationUseCaseParams> {
  final InstallationRepository _installationRepository;

  UpdateInstallationUseCase({
    required InstallationRepository installationRepository,
  }) : _installationRepository = installationRepository;

  @override
  Future<void> invoke(UpdateInstallationUseCaseParams params) {
    return _installationRepository.update(params);
  }
}

class UpdateInstallationUseCaseParams {
  final String appId;
  final String appVersion;
  final String deviceType;
  final String locale;
  final String timezone;
  final String osVersion;
  final String deviceBrand;

  UpdateInstallationUseCaseParams({
    required this.appId,
    required this.appVersion,
    required this.deviceType,
    required this.locale,
    required this.timezone,
    required this.osVersion,
    required this.deviceBrand,
  });
}

@riverpod
Future<UpdateInstallationUseCase> updateInstallationUseCase(Ref ref) async {
  final InstallationRepository installationRepository = await ref.watch(
    installationDataRepositoryProvider.future,
  );

  return UpdateInstallationUseCase(
    installationRepository: installationRepository,
  );
}
