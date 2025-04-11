import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_app_flutter/app/app.dart';
import 'package:mon_app_flutter/app/localizations/localizations.g.dart';

void main() async {
  /// Wait for widget binding
  WidgetsFlutterBinding.ensureInitialized();

  /// Localization setup
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: <Locale>[Locale('fr'), Locale('en')],
        path: 'assets/translations',
        assetLoader: CodegenLoader(),
        child: RootAppWidget(),
      ),
    ),
  );
}
