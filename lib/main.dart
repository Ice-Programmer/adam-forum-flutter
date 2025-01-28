import 'package:adam_forum_app/app.dart';
import 'package:adam_forum_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProxyProvider(
        create: (content) => ThemeProvider(),
        update: (context, settingsProvider, themeProvider) {
          return ThemeProvider(); // 返回原始的 themeProvider 实例
        },
      )
    ],
    child: const App(),
  ));
}
