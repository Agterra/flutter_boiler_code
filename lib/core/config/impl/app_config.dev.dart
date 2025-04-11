import 'package:mon_app_flutter/core/config/app_config.dart';
import 'package:mon_app_flutter/core/providers/environment.dart';

final class AppConfigDev implements AppConfig {
  @override
  String get baseUrl => 'https://a_real_url.fr';

  @override
  String get appName => 'mon_app - Dev';

  @override
  Environment get env => Environment.dev;
}
