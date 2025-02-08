import 'package:flutter/material.dart';

/// 自定义输入框
class CustomInput extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String? hintText;
  final double horizontalPadding;
  final double fontSize;
  final Color? backgroundColor;
  final int maxLines;
  final bool isPassword;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final IconData? prefixIcon;
  final double prefixGap;

  const CustomInput({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 10,
    this.hintText,
    this.horizontalPadding = 20,
    this.fontSize = 16,
    this.maxLines = 1,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.backgroundColor,
    this.prefixIcon,
    this.prefixGap = 20,
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
        color:
            widget.backgroundColor ?? Theme.of(context).colorScheme.secondary,
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
          prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
          prefixIconConstraints: BoxConstraints(
            minWidth: widget.prefixGap, // 设置最小宽度，控制间距
            minHeight: widget.height, // 设置最小高度，与输入框高度一致
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
