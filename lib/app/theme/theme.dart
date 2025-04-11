import 'package:flutter/material.dart';
import 'package:mon_app_flutter/app/theme/dark.color_scheme.dart';
import 'package:mon_app_flutter/app/theme/light.color_scheme.dart';

const String defaultFontFamily = 'Figtree';

final ThemeData darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  fontFamily: defaultFontFamily,
);

final ThemeData lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  fontFamily: defaultFontFamily,
);

extension CustomAlpha on Color {
  Color withAlphaPercentage(int value) {
    final int alphaValue = ((value * 255) / 100).round();
    return withAlpha(alphaValue);
  }
}
