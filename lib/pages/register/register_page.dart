import 'package:adam_forum_app/layouts/login_layout.dart';
import 'package:adam_forum_app/components/other_login_method.dart';
import 'package:adam_forum_app/pages/register/components/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return LoginLayout(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 注册页欢迎文字
              _getRegisterWelcomeText(context),

              RegisterForm(),

              const OtherLoginMethod(),
            ]),
      ),
    );
  }

  Widget _getRegisterWelcomeText(BuildContext context) {
    return Column(
      children: [
        100.verticalSpace,
        Text(
          "用户注册",
          style: TextStyle(
            fontSize: 30.sp,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        26.verticalSpace,
        Text(
          "连接每一个精彩瞬间",
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
