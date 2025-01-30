import 'package:adam_forum_app/layouts/login_layout.dart';
import 'package:adam_forum_app/pages/login/components/login_form.dart';
import 'package:adam_forum_app/components/other_login_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 登录页
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return LoginLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 登录页欢迎文字
            _getLoginWelcomeText(context),

            LoginForum(),

            const OtherLoginMethod(),
          ],
        ),
      ),
    );
  }

  Widget _getLoginWelcomeText(BuildContext context) {
    return Column(
      children: [
        100.verticalSpace,
        Text(
          "用户登录",
          style: TextStyle(
            fontSize: 30.sp,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        26.verticalSpace,
        Text(
          "欢迎回来",
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        Text(
          "我们一直想念您",
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
