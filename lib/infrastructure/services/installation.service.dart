import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/core/exceptions/installation.exception.dart';
import 'package:mon_app_flutter/core/providers/device_info.dart';
import 'package:mon_app_flutter/core/providers/package_info.dart';
import 'package:mon_app_flutter/core/providers/timezone.dart';
import 'package:mon_app_flutter/domain/entities/installation.entity.dart';
import 'package:mon_app_flutter/domain/services/installation.service.interface.dart';
import 'package:mon_app_flutter/domain/usecases/installation/create_installation.usecase.dart';
import 'package:mon_app_flutter/domain/usecases/installation/get_installation.usecase.dart';
import 'package:mon_app_flutter/domain/usecases/installation/save_installation.usecase.dart';
import 'package:mon_app_flutter/domain/usecases/results.usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'installation.service.g.dart';

class AppInstallationService implements InstallationService {
  final CreateInstallationUseCase _createInstallationUseCase;
  final SaveInstallationUseCase _saveInstallationUseCase;
  final GetInstallationUseCase _getInstallationUseCase;
  final DeviceInfo _deviceInfo;
  final PackageInformation _packageInformation;
  final String _timezone;

  AppInstallationService({
    required CreateInstallationUseCase createInstallationUseCase,
    required SaveInstallationUseCase saveInstallationUseCase,
    required GetInstallationUseCase getInstallationUseCase,
    required DeviceInfo deviceInfo,
    required PackageInformation packageInformation,
    required String timezone,
  }) : _createInstallationUseCase = createInstallationUseCase,
       _saveInstallationUseCase = saveInstallationUseCase,
       _getInstallationUseCase = getInstallationUseCase,
       _deviceInfo = deviceInfo,
       _packageInformation = packageInformation,
       _timezone = timezone;

  @override
  Future<ResultState<InstallationEntity>?> get installation =>
      _getInstallationUseCase.execute();
  @override
  Future<void> init() async {
    final ResultState<void> result = await _getInstallationUseCase.execute();

    await result.when(
      failure: (_) async {
        await _createNewInstallation();
      },
    );

    AppLifecycleListener(onResume: () {});
  }

  Future<void> _createNewInstallation() async {
    final CreateInstallUseCaseParams params = CreateInstallUseCaseParams(
      appId: _packageInformation.packageName,
      appVersion: _packageInformation.version,
      deviceType: Platform.operatingSystem,
      locale: Platform.localeName,
      timezone: _timezone,
      osVersion: _deviceInfo.osVersion,
      deviceBrand: _deviceInfo.brand,
      pushToken: 'xxxx',
    );

    final ResultState<InstallationEntity> result =
        await _createInstallationUseCase.execute(params);

    result.when(
      failure: (Exception exception) {
        throw InstallationException(message: exception.toString());
      },
      success:
          (InstallationEntity data) => <Future<ResultState<void>>>{
            _saveInstallationUseCase.execute(data),
          },
    );
  }
}

@Riverpod(keepAlive: true)
Future<InstallationService> installationService(Ref ref) async {
  final CreateInstallationUseCase createInstallationUseCase = await ref.watch(
    createInstallUseCaseProvider.future,
  );
  final SaveInstallationUseCase saveInstallationUseCase = await ref.watch(
    saveInstallationUseCaseProvider.future,
  );
  final GetInstallationUseCase getInstallationUseCase = await ref.watch(
    getInstallationUseCaseProvider.future,
  );
  final DeviceInfo deviceInfo = await ref.watch(deviceInfoProvider.future);
  final PackageInformation packageInformation = await ref.watch(
    packageInformationProvider.future,
  );
  final String timezone = await ref.watch(timezoneProvider.future);

  final AppInstallationService appInstallationService = AppInstallationService(
    createInstallationUseCase: createInstallationUseCase,
    saveInstallationUseCase: saveInstallationUseCase,
    getInstallationUseCase: getInstallationUseCase,
    deviceInfo: deviceInfo,
    packageInformation: packageInformation,
    timezone: timezone,
  );

  await appInstallationService.init();

  return appInstallationService;
}
