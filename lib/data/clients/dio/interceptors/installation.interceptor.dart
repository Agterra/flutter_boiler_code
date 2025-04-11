import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/data/clients/dio/dio.client.dart';
import 'package:mon_app_flutter/domain/entities/installation.entity.dart';
import 'package:mon_app_flutter/domain/usecases/installation/get_installation.usecase.dart';
import 'package:mon_app_flutter/domain/usecases/results.usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'installation.interceptor.g.dart';

class InstallationInterceptor {
  final DioClient _dioClient;
  final GetInstallationUseCase _getInstallationUseCase;

  InstallationInterceptor({
    required DioClient dioClient,
    required GetInstallationUseCase getInstallationUseCase,
  }) : _dioClient = dioClient,
       _getInstallationUseCase = getInstallationUseCase {
    _registerInterceptor();
  }

  void _registerInterceptor() {
    _dioClient.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          final ResultState<InstallationEntity> result =
              await _getInstallationUseCase.execute();

          result.when(
            success:
                (InstallationEntity installation) => options.headers.addAll(
                  <String, dynamic>{'x-installation-id': installation.id},
                ),
          );

          return handler.next(options);
        },
      ),
    );
  }
}

@Riverpod(keepAlive: true)
Future<InstallationInterceptor> installationInterceptor(Ref ref) async {
  final DioClient dioClient = ref.watch(dioClientProvider);
  final GetInstallationUseCase getInstallationUseCase = await ref.watch(
    getInstallationUseCaseProvider.future,
  );
  return InstallationInterceptor(
    dioClient: dioClient,
    getInstallationUseCase: getInstallationUseCase,
  );
}
