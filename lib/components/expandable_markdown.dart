import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui'; // 用于模糊效果

class ExpandableMarkdown extends StatefulWidget {
  final String data;
  final int maxLength;
  final MarkdownStyleSheet? styleSheet;

  const ExpandableMarkdown({
    super.key,
    required this.data,
    this.maxLength = 200,
    this.styleSheet,
  });

  @override
  State<ExpandableMarkdown> createState() => _ExpandableMarkdownState();
}

class _ExpandableMarkdownState extends State<ExpandableMarkdown> {
  bool isExpanded = false; // 是否展开

  @override
  Widget build(BuildContext context) {
    final bool isTextLong = widget.data.length > widget.maxLength; // 判断文本是否超长
    final String displayText = isExpanded
        ? widget.data // 展开时显示完整内容
        : widget.data.substring(
            0, widget.maxLength.clamp(0, widget.data.length)); // 折叠时显示截取内容

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 显示 Markdown 内容
        Stack(
          children: [
            MarkdownBody(
              data: displayText,
              styleSheet: widget.styleSheet,
            ),

            // 模糊效果
            if (isTextLong && !isExpanded)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: Container(
                      height: 50.h, // 模糊区域高度
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.8),
                            Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // 展开按钮
            if (isTextLong && !isExpanded)
              Positioned(
                bottom: 10.h, // 按钮距离底部的距离
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = true; // 切换展开状态
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '展开',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.expand_more,
                          color: Theme.of(context).colorScheme.primary,
                          size: 16.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),

        10.verticalSpace,
      ],
    );
  }
}
