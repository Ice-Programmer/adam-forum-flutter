import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 自定义输入框
class CustomInput extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String? hintText;
  final double horizontalPadding;
  final double fontSize;
  final int maxLines;
  final bool isPassword;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const CustomInput({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 10,
    this.hintText,
    this.horizontalPadding = 20,
    required this.fontSize,
    this.maxLines = 1,
    this.isPassword = false,
    this.validator,
    this.onChanged,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  // 控制密码可见性
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: TextFormField(
        maxLines: widget.maxLines,
        textAlignVertical: TextAlignVertical.center,
        obscureText: widget.isPassword ? _obscureText : false,
        // 是否隐藏文本
        style: TextStyle(
          fontSize: widget.fontSize,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: widget.fontSize,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          hintText: widget.hintText,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
        onChanged: widget.onChanged,
        validator: widget.validator,
      ),
    );
  }
}
