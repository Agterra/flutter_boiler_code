import 'package:mon_app_flutter/core/config/app_config.dart';
import 'package:mon_app_flutter/core/providers/environment.dart';

final class AppConfigMock implements AppConfig {
  @override
  String get baseUrl => 'http://localhost:3000';

  @override
  String get appName => 'mon_app - Mock';

  @override
  Environment get env => Environment.mock;
}
