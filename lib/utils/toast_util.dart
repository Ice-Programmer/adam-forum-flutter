import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

class ToastUtils {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => rootNavigatorKey.currentContext!;

  static const Color successColor = Color(0xFF75FB4C);
  static const Color errorColor = Color(0xFFEA3323);

  static const IconData successIcon = LineIcons.checkCircle;
  static const IconData errorIcon = LineIcons.ban;
  static const IconData infoIcon = LineIcons.infoCircle;

  /// 显示成功吐司
  /// [msg] 消息
  /// [icon] 图标
  static showSuccessMsg(String message, {IconData? icon}) {
    DelightToastBar(
      autoDismiss: true,
      position: DelightSnackbarPosition.top,
      snackbarDuration: const Duration(milliseconds: 2000),
      builder: (context) => ToastCard(
        leading: Icon(
          icon ?? Icons.info_sharp,
          color: successColor,
          size: 20.r,
        ),
        title: Text(
          message ?? '请求成功',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
      ),
    ).show(context);
  }

  /// 显示错误吐司
  /// [msg] 消息
  /// [icon] 图标
  static showErrorMsg(String message, {IconData? icon}) {
    DelightToastBar(
      autoDismiss: true,
      position: DelightSnackbarPosition.top,
      snackbarDuration: const Duration(milliseconds: 2000),
      builder: (context) => ToastCard(
        leading: Icon(
          icon ?? Icons.error_sharp,
          color: errorColor,
          size: 20.r,
        ),
        title: Text(
          message ?? '请求失败',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
      ),
    ).show(context);
  }

  /// 显示提示吐司
  /// [msg] 消息
  /// [icon] 图标
  static showInfoMsg(String message, {IconData? icon}) {
    DelightToastBar(
      autoDismiss: true,
      position: DelightSnackbarPosition.top,
      snackbarDuration: const Duration(milliseconds: 2000),
      builder: (context) => ToastCard(
        leading: Icon(
          icon ?? Icons.info_sharp,
          color: successColor,
          size: 20.r,
        ),
        title: Text(
          message ?? '请求成功',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
      ),
    ).show(context);
  }
}
