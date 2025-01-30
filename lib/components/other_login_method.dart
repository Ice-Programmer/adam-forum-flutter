import 'package:adam_forum_app/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherLoginMethod extends StatelessWidget {
  const OtherLoginMethod({super.key});

  @override
  Widget build(BuildContext context) {
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
    );  }
}
