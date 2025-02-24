import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PostCommentCardSkeleton extends StatelessWidget {
  const PostCommentCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
            ),
          ),
          10.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.verticalSpace,
              Container(
                width: 50.w,
                height: 10.h,
                color: Colors.white,
              ),
              5.verticalSpace,
              Container(
                width: 40.w,
                height: 10.h,
                color: Colors.white,
              ),
              5.verticalSpace,
              Container(
                width: 150.w,
                height: 10.h,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
