import 'package:adam_forum_app/components/custom_button.dart';
import 'package:adam_forum_app/components/custom_input.dart';
import 'package:adam_forum_app/model/forum_auth/register/user_account_register_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});

  final _formUserRegisterKey = GlobalKey<FormState>();
  final UserAccountRegisterRequest _userAccountRegisterRequest =
      UserAccountRegisterRequest();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formUserRegisterKey,
          child: Column(
            children: [
              // 账号输入框
              CustomInput(
                width: 350.w,
                height: 60.h,
                hintText: "账号",
                fontSize: 16.sp,
                onChanged: (String account) =>
                    _userAccountRegisterRequest.userAccount = account,
              ),

              30.verticalSpace,

              // 密码输入框
              CustomInput(
                width: 350.w,
                height: 60.h,
                hintText: "密码",
                isPassword: true,
                fontSize: 16.sp,
                onChanged: (String password) =>
                    _userAccountRegisterRequest.userPassword = password,
              ),

              30.verticalSpace,

              // 确认密码
              CustomInput(
                width: 350.w,
                height: 60.h,
                hintText: "确认密码",
                isPassword: true,
                fontSize: 16.sp,
                onChanged: (String checkPassword) =>
                    _userAccountRegisterRequest.checkPassword = checkPassword,
              ),

              60.verticalSpace,

              CustomButton(
                title: "注册",
                onPressed: () {
                  print('account: ${_userAccountRegisterRequest.userAccount}');
                  print(
                      'password: ${_userAccountRegisterRequest.userPassword}');
                  print(
                      'checkPassword: ${_userAccountRegisterRequest.checkPassword}');
                },
                backgroundColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                btnWidth: 350.w,
                btnHeight: 60.h,
                fontSize: 20.sp,
              ),

              30.verticalSpace,

              InkWell(
                onTap: () {
                  context.go('/login');
                }, // 添加点击事件
                child: Text(
                  "已经拥有账号",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
