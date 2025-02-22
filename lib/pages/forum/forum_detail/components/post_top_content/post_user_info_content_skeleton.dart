import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PostUserInfoContentSkeleton extends StatelessWidget {
  const PostUserInfoContentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, // 骨架屏基础颜色
      highlightColor: Colors.grey[100]!, // 骨架屏高亮颜色
      child: Row(
        children: [
          // 用户头像骨架屏
          Container(
            width: 50.h,
            height: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white, // 占位符颜色
            ),
          ),

          10.horizontalSpace,

          // 用户名 & 发帖时间骨架屏
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 用户名占位符
              Container(
                width: 100.w,
                height: 16.h,
                color: Colors.white,
              ),
              SizedBox(height: 8.h),
              // 发帖时间占位符
              Container(
                width: 80.w,
                height: 13.h,
                color: Colors.white,
              ),
            ],
          ),

          const Spacer(),

          // 关注按钮骨架屏
          Container(
            width: 100.w,
            height: 35.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: Colors.white, // 占位符颜色
            ),
          ),
        ],
      ),
    );
  }
}