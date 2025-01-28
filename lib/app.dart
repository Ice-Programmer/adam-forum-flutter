import 'package:adam_forum_app/pages/welcome/welcome_page.dart';
import 'package:adam_forum_app/theme/dark_theme.dart';
import 'package:adam_forum_app/theme/theme_provider.dart';
import 'package:adam_forum_app/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Size get designSize {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  // 逻辑短边
  final logicalShortestSize =
      firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  // 逻辑长边
  final logicalLongestSize =
      firstView.physicalSize.longestSide / firstView.devicePixelRatio;
  // 缩放比例
  const scaleFactor = 0.95;
  return Size(
    logicalShortestSize * scaleFactor,
    logicalLongestSize * scaleFactor,
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: ToastUtils.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context, listen: true).themeData,
          darkTheme: darkMode,
          home: const WelcomePage(),
        );
      },
    );
  }
}
