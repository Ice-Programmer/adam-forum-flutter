import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSearchButton extends StatelessWidget {
  const TopSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100.w,
        height: 30.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            10.horizontalSpace,
            Icon(
              Icons.search_rounded,
              color: Colors.black,
              size: 15.sp,
            ),
            5.horizontalSpace,
            Text(
              "搜索",
              style: TextStyle(fontSize: 15.sp, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
