import 'package:json_annotation/json_annotation.dart';
import 'package:mon_app_flutter/domain/usecases/installation/create_installation.usecase.dart';
import 'package:mon_app_flutter/domain/usecases/installation/update_installation.usecase.dart';

part 'installation.requests.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateInstallationBody {
  final String appId;
  final String appVersion;
  final String deviceType;
  final String locale;
  final String timezone;
  final String osVersion;
  final String deviceBrand;

  CreateInstallationBody({
    required this.appId,
    required this.appVersion,
    required this.deviceType,
    required this.locale,
    required this.timezone,
    required this.osVersion,
    required this.deviceBrand,
  });

  static CreateInstallationBody fromUseCaseParams(
    CreateInstallUseCaseParams params,
  ) {
    return CreateInstallationBody(
      appId: params.appId,
      appVersion: params.appVersion,
      deviceType: params.deviceType,
      locale: params.locale,
      timezone: params.timezone,
      osVersion: params.osVersion,
      deviceBrand: params.deviceBrand,
    );
  }

  Map<String, dynamic> toJson() => _$CreateInstallationBodyToJson(this);
}

class UpdateInstallationBody {
  final String appId;
  final String appVersion;
  final String deviceType;
  final String locale;
  final String timezone;
  final String osVersion;
  final String deviceBrand;

  UpdateInstallationBody({
    required this.appId,
    required this.appVersion,
    required this.deviceType,
    required this.locale,
    required this.timezone,
    required this.osVersion,
    required this.deviceBrand,
  });

  static UpdateInstallationBody fromUseCaseParams(
    UpdateInstallationUseCaseParams params,
  ) {
    return UpdateInstallationBody(
      appId: params.appId,
      appVersion: params.appVersion,
      deviceType: params.deviceType,
      locale: params.locale,
      timezone: params.timezone,
      osVersion: params.osVersion,
      deviceBrand: params.deviceBrand,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      appId: appId,
      appVersion: appVersion,
      deviceBrand: deviceBrand,
      deviceType: deviceType,
      locale: locale,
      osVersion: osVersion,
      timezone: timezone,
    };
  }
}
