import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../theme/dark/dark_theme.dart';
import '../theme/light/light_theme.dart';
import '../theme/theme_notifer.dart';

extension ThemeTypeExtension on ThemeType {
  ThemeData get generate {
    switch (this) {
      case ThemeType.dark:
        return DarkTheme().theme;
      case ThemeType.light:
        return LightTheme().theme;
      default:
        return ThemeData.light();
    }
  }
}
