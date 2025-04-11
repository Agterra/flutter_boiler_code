import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/domain/services/dialog.service.interface.dart';
import 'package:mon_app_flutter/infrastructure/routing/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dialog.service.g.dart';

class AppDialogService implements DialogService {
  final AppRouter _appRouter;

  AppDialogService({required AppRouter appRouter}) : _appRouter = appRouter;

  @override
  Future<StreamController<String>?> showLoadingDialog({
    bool dismissible = false,
  }) async {
    final BuildContext? context = _appRouter.navigatorKey.currentContext;
    if (context == null) return null;

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final StreamController<String> streamController =
        StreamController<String>();

    await _showDialog(context, <Widget>[
      CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
      ),
    ]);

    return streamController;
  }

  @override
  void closeLoadingDialog() {
    final BuildContext? context = _appRouter.navigatorKey.currentContext;
    if (context == null) return;

    Navigator.of(context, rootNavigator: true).maybePop();
  }

  @override
  Future<void> showErrorDiablog(String error) async {
    final BuildContext? context = _appRouter.navigatorKey.currentContext;
    if (context == null) return;

    await _showDialog(context, <Widget>[
      Text('Error', style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 16),
      Text(error),
    ]);
  }

  Future<void> _showDialog(BuildContext context, List<Widget> children) async {
    return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        final ColorScheme colorScheme = Theme.of(innerContext).colorScheme;
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceDim,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  color: colorScheme.surfaceDim,
                  child: ColoredBox(
                    color: colorScheme.surfaceDim,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: children,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Future<void> showCustomDialog({required Widget child}) async {
    final BuildContext? context = _appRouter.navigatorKey.currentContext;
    if (context == null) return;
    await showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(36),
              child: child,
            ),
          ),
        );
      },
    );
  }
}

@Riverpod(keepAlive: true)
DialogService dialogService(Ref ref) {
  final AppRouter appRouter = ref.watch(routerProvider);
  return AppDialogService(appRouter: appRouter);
}
