import 'package:adam_forum_app/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
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
          ),
        ],
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
          textWidth: 20.sp,
          textColor: Colors.white,
          onPressed: () {},
        ),
        CustomButton(
          title: "注册",
          btnWidth: screenWidth * 0.37,
          btnHeight: 60.h,
          textColor: Colors.black,
          textWidth: 20.sp,
          onPressed: () {},
        ),
      ],
    );
  }
}
