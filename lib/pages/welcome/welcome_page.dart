import 'package:adam_forum_app/components/custom_button.dart';
import 'package:adam_forum_app/layouts/login_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginLayout(
      child: Center(
        child: Column(
          children: [
            // 欢迎图片
            _getWelcomePicture(),

            40.verticalSpace,

            // 欢迎文字
            _getWelcomeText(context),

            const Spacer(),

            // 注册登录按钮
            _getLoginButton(context),

            100.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _getWelcomePicture() {
    return Container(
      margin: EdgeInsets.only(top: 80.h),
      child: SvgPicture.asset(
        "images/welcome.svg",
      ),
    );
  }

  Widget _getWelcomeText(BuildContext context) {
    return Column(
      children: [
        Text(
          "欢迎来到",
          style: TextStyle(
            fontSize: 35.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          "AdamForum",
          style: TextStyle(
            fontSize: 35.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        10.verticalSpace,
        Text(
          "聚焦交流，畅享生活",
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _getLoginButton(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          title: "登录",
          btnWidth: screenWidth * 0.37,
          btnHeight: 60.h,
          backgroundColor: Theme.of(context).colorScheme.primary,
          fontSize: 20.sp,
          textColor: Colors.white,
          onPressed: () {
            context.go('/login');
          },
        ),
        CustomButton(
          title: "注册",
          btnWidth: screenWidth * 0.37,
          btnHeight: 60.h,
          textColor: Colors.black,
          fontSize: 20.sp,
          onPressed: () {
            context.go("/register");
          },
        ),
      ],
    );
  }
}
