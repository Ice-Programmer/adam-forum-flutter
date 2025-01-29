import 'package:adam_forum_app/theme/dark_theme.dart';
import 'package:adam_forum_app/theme/light_theme.dart';
import 'package:adam_forum_app/utils/log_util.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  ThemeData get lightTheme => lightMode;

  ThemeData get darkTheme => darkMode;

  bool get isDarkMode => _themeData == darkTheme;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  /// 切换主题
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
