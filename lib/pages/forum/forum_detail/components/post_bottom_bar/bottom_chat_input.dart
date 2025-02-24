import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomChatInput extends StatelessWidget {
  const BottomChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            10.horizontalSpace,
            Icon(
              Icons.chat_outlined,
              color: Colors.grey.shade900,
              size: 15.sp,
            ),
            5.horizontalSpace,
            Text(
              "你也来说两句吧...",
              style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade900,),
            ),
          ],
        ),
      ),
    );
  }
}
