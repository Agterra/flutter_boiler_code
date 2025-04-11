import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/core/config/impl/app_config.dev.dart';
import 'package:mon_app_flutter/core/config/impl/app_config.mock.dart';
import 'package:mon_app_flutter/core/providers/environment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config.g.dart';

abstract class AppConfig {
  final Environment env;
  final String appName;
  final String baseUrl;

  AppConfig({required this.appName, required this.baseUrl, required this.env});
}

@Riverpod(keepAlive: true)
AppConfig appConfig(Ref ref) {
  final Environment env = ref.watch(envProvider);
  switch (env) {
    case Environment.mock:
      return AppConfigMock();
    case Environment.dev:
      return AppConfigDev();
  }
}
