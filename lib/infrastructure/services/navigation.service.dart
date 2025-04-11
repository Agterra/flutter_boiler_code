import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/domain/services/navigation.service.interface.dart';
import 'package:mon_app_flutter/infrastructure/routing/app_router.dart';
import 'package:mon_app_flutter/infrastructure/routing/app_router.gr.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation.service.g.dart';

class AppNavigationService implements NavigationService {
  final AppRouter _appRouter;

  AppNavigationService({required AppRouter appRouter}) : _appRouter = appRouter;

  @override
  void reset() {
    return _appRouter.popUntilRoot();
  }

  @override
  Future<bool> goBack() => _appRouter.maybePop();

  @override
  Future<void> loading() => _appRouter.push(const LoadingView());

  @override
  Future<void> home() => _appRouter.push(const LandingRoute());
}

@Riverpod(keepAlive: true)
NavigationService navigationService(Ref ref) {
  final AppRouter appRouter = ref.watch(routerProvider);
  return AppNavigationService(appRouter: appRouter);
}
