import 'package:mon_app_flutter/domain/entities/installation.entity.dart';
import 'package:mon_app_flutter/domain/usecases/results.usecases.dart';

abstract class InstallationService {
  Future<ResultState<InstallationEntity>?> get installation;
  Future<void> init();
}
