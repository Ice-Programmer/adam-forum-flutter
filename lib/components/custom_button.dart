import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color textColor;
  final double btnWidth;
  final double btnHeight;
  final double textWidth;
  final VoidCallback onPressed;
  final double borderRadius;
  final bool isShadow;
  final FontWeight fontWeight;

  const CustomButton({
    super.key,
    required this.title,
    this.backgroundColor,
    required this.onPressed,
    required this.textColor,
    required this.btnWidth,
    required this.btnHeight,
    required this.textWidth,
    this.borderRadius = 10,
    this.isShadow = true,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: btnHeight,
      width: btnWidth,
      decoration: BoxDecoration(
        color: backgroundColor, // 背景颜色
        borderRadius: BorderRadius.circular(borderRadius.r), // 圆角
        boxShadow: (isShadow && backgroundColor != null)
            ? [
                BoxShadow(
                  color: backgroundColor!.withOpacity(0.3), // 阴影颜色
                  spreadRadius: 2.r, // 阴影扩散半径
                  blurRadius: 5.r, // 模糊半径
                  offset: Offset(0, 3.h), // 阴影偏移量
                ),
              ]
            : [],
      ),
      child: MaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        onPressed: onPressed,
        color: backgroundColor,
        child: Text(
          title,
          style: TextStyle(
            fontSize: textWidth,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
