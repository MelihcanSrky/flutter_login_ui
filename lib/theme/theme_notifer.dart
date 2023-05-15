import 'package:flutter_netigma_login/extensions/theme_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/theme/light/light_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = LightTheme().theme;

  ThemeType _currenThemeEnum = ThemeType.light;

  ThemeType get currenThemeEnum => _currenThemeEnum;
  // final Settings settings;
  ThemeData get currentTheme {
    // bool isLightTheme = settings.lightThemeMode ?? true;
//_currenThemeEnum = isLightTheme ? ThemeType.light : ThemeType.dark;
    _currentTheme = _currenThemeEnum.generate;
    return _currentTheme;
  }

  Future<void> changeTheme(ThemeType theme) async {
    _currenThemeEnum = theme;
    _currentTheme = _currenThemeEnum.generate;
    //  settings.setLightThemeMode = theme == ThemeType.light;
    notifyListeners();
  }
}

enum ThemeType { light, dark }
