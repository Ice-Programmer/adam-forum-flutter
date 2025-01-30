import 'package:adam_forum_app/components/custom_button.dart';
import 'package:adam_forum_app/components/custom_input.dart';
import 'package:adam_forum_app/layouts/login_layout.dart';
import 'package:adam_forum_app/model/forum_auth/login/user_password_login_request.dart';
import 'package:adam_forum_app/pages/login/components/login_forum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

            _getOtherLogin(context),
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

  Widget _getOtherLogin(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double bottomMargin = screenHeight * 0.1;
    return Column(
      children: [
        Text(
          "其他登录方式",
          style: TextStyle(
            fontSize: 14.sp,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        20.verticalSpace,
        SizedBox(
          width: 240.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                icon: Icons.apple_rounded,
                onPressed: () {},
                textColor: Colors.black,
                backgroundColor: const Color(0xFFECECEC),
                btnWidth: 60.w,
                btnHeight: 44.h,
                fontSize: 18.sp,
              ),
              CustomButton(
                icon: Icons.wechat_rounded,
                onPressed: () {},
                textColor: Colors.black,
                backgroundColor: const Color(0xFFECECEC),
                btnWidth: 60.w,
                btnHeight: 44.h,
                fontSize: 18.sp,
              ),
              CustomButton(
                icon: Icons.mail_rounded,
                onPressed: () {},
                textColor: Colors.black,
                backgroundColor: const Color(0xFFECECEC),
                btnWidth: 60.w,
                btnHeight: 44.h,
                fontSize: 18.sp,
              ),
            ],
          ),
        ),
        bottomMargin.verticalSpace,
      ],
    );
  }
}
