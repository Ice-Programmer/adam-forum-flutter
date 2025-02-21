import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final double? iconGap;
  final Color? backgroundColor;
  final Color textColor;
  final double btnWidth;
  final double btnHeight;
  final double fontSize;
  final VoidCallback? onPressed;
  final double borderRadius;
  final bool isShadow;
  final FontWeight fontWeight;
  final bool disable;
  final Color? borderColor;

  const CustomButton({
    super.key,
    this.title,
    this.icon,
    this.iconGap,
    this.backgroundColor,
    this.onPressed,
    required this.textColor,
    required this.btnWidth,
    required this.btnHeight,
    required this.fontSize,
    this.borderRadius = 10,
    this.isShadow = true,
    this.fontWeight = FontWeight.bold,
    this.disable = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: btnHeight,
      width: btnWidth,
      decoration: BoxDecoration(
        color: backgroundColor, // 背景颜色
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        // border: Border.all(color: borderColor!),
        boxShadow: (isShadow && backgroundColor != null)
            ? [
                BoxShadow(
                  color: backgroundColor!.withOpacity(0.3),
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
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        onPressed: onPressed,
        color: backgroundColor,
        elevation: 0,
        highlightElevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: textColor,
                size: fontSize,
              ),
            if (iconGap != null) iconGap!.horizontalSpace,
            if (title != null)
              Text(
                title!,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: textColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
