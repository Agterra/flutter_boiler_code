import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info.g.dart';

class PackageInformation {
  final String appName;
  final String packageName;
  final String version;
  final String buildNumber;

  PackageInformation({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
  });
}

@riverpod
Future<PackageInformation> packageInformation(Ref ref) async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return PackageInformation(
    appName: packageInfo.appName,
    packageName: packageInfo.packageName,
    version: packageInfo.version,
    buildNumber: packageInfo.buildNumber,
  );
}
