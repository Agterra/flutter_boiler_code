import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/app/theme/theme.dart';
import 'package:mon_app_flutter/app/views/components/loading/loading.view.dart';
import 'package:mon_app_flutter/core/providers/bootstrap.dart';
import 'package:mon_app_flutter/infrastructure/routing/app_router.dart';

class AppStartup extends ConsumerWidget {
  final WidgetBuilder onLoaded;

  const AppStartup({super.key, required this.onLoaded});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> appState = ref.watch(bootstrapProvider);

    return appState.when(
      data: (_) {
        return onLoaded(context);
      },
      error: (Object error, StackTrace stackTrace) {
        return Center(
          child: Text(error.toString(), style: TextStyle(fontSize: 12)),
        );
      },
      loading: LoadingView.new,
    );
  }
}

class RootAppWidget extends ConsumerWidget {
  const RootAppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRouter router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router.config(),
      builder: (BuildContext context, Widget? child) {
        return AppStartup(onLoaded: (_) => child!);
      },
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      locale: context.locale,
    );
  }
}
