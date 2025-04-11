import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/core/exceptions/unhandled_platform.exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_info.g.dart';

class DeviceInfo {
  final String brand;
  final String osVersion;

  DeviceInfo({required this.brand, required this.osVersion});
}

@riverpod
Future<DeviceInfo> deviceInfo(Ref ref) async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String brand = '';
  String osVersion = '';

  if (Platform.isAndroid) {
    final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    brand = androidInfo.brand;
    osVersion = androidInfo.version.release;
  } else if (Platform.isIOS) {
    final IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    brand = iosDeviceInfo.model;
    osVersion = iosDeviceInfo.systemVersion;
  } else {
    throw UnhandledPlatformException(
      message: 'This platform is not supported by the app.',
    );
  }

  return DeviceInfo(brand: brand, osVersion: osVersion);
}
