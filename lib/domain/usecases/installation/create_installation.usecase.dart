import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/data/repositories/installation.data_repository.dart';
import 'package:mon_app_flutter/domain/entities/installation.entity.dart';
import 'package:mon_app_flutter/domain/repositories/installation.repository.dart';
import 'package:mon_app_flutter/domain/usecases/future.usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_installation.usecase.g.dart';

class CreateInstallationUseCase
    extends
        FutureUseCaseWithParams<
          InstallationEntity,
          CreateInstallUseCaseParams
        > {
  final InstallationRepository _installationRepository;

  CreateInstallationUseCase({
    required InstallationRepository installationRepository,
  }) : _installationRepository = installationRepository;

  @override
  Future<InstallationEntity> invoke(CreateInstallUseCaseParams params) {
    return _installationRepository.create(params);
  }
}

class CreateInstallUseCaseParams {
  final String appId;
  final String appVersion;
  final String deviceType;
  final String locale;
  final String timezone;
  final String osVersion;
  final String deviceBrand;
  final String? pushToken;

  CreateInstallUseCaseParams({
    required this.appId,
    required this.appVersion,
    required this.deviceType,
    required this.locale,
    required this.timezone,
    required this.osVersion,
    required this.deviceBrand,
    required this.pushToken,
  });
}

@riverpod
Future<CreateInstallationUseCase> createInstallUseCase(Ref ref) async {
  final InstallationRepository installationRepository = await ref.watch(
    installationDataRepositoryProvider.future,
  );
  return CreateInstallationUseCase(
    installationRepository: installationRepository,
  );
}
