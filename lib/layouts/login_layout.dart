import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginLayout extends StatelessWidget {
  final Widget child;

  const LoginLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // 设置状态栏为黑色图标和文字
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // 设置状态栏背景透明
    ));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // 设置背景图片
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Welcome Screen.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
