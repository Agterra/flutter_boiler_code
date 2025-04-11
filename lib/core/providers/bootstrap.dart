import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/data/clients/dio/interceptors/installation.interceptor.dart';
import 'package:mon_app_flutter/infrastructure/services/installation.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bootstrap.g.dart';

@Riverpod(keepAlive: true)
Future<void> bootstrap(Ref ref) async {
  ref.onDispose(() {
    ref
      // ..invalidate(firebaseAppProvider)
      ..invalidate(installationServiceProvider)
      ..invalidate(installationInterceptorProvider);
  });

  /// Non co-dependant dependencies initialization for async providers
  await Future.wait(<Future<Object?>>[
    // ref.watch(firebaseAppProvider.future),
    ref.watch(installationServiceProvider.future),
    ref.watch(installationInterceptorProvider.future),
  ]);
}
