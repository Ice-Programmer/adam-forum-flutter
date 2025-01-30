import 'package:adam_forum_app/components/custom_button.dart';
import 'package:adam_forum_app/components/custom_input.dart';
import 'package:adam_forum_app/model/forum_auth/login/user_password_login_request.dart';
import 'package:adam_forum_app/service/forum-auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginForum extends StatelessWidget {
  LoginForum({super.key});

  final _formKey = GlobalKey<FormState>();
  final UserPasswordLoginRequest _userPasswordLoginRequest =
      UserPasswordLoginRequest();
  final AuthService _authService = AuthService(); // 创建 AuthService 实例

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              // 账号输入框
              CustomInput(
                width: 350.w,
                height: 60.h,
                hintText: "账号",
                fontSize: 16.sp,
                onChanged: (String account) =>
                    _userPasswordLoginRequest.userAccount = account,
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
                    _userPasswordLoginRequest.userPassword = password,
              ),

              30.verticalSpace,

              SizedBox(
                width: 350.w, // 和输入框一样的宽度
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {}, // 添加点击事件
                      child: Text(
                        "忘记密码?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              30.verticalSpace,

              CustomButton(
                title: "登录",
                onPressed: () {
                  _handleLogin(context);
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
                  context.go('/register');
                }, // 添加点击事件
                child: Text(
                  "新用户注册",
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

  Future<void> _handleLogin(BuildContext context) async {
    final response = await _authService.userPasswordLogin(_userPasswordLoginRequest);
  }
}
