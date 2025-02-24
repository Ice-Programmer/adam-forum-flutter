import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PostContentSkeleton extends StatelessWidget {
  const PostContentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    double bannerHeight = MediaQuery.of(context).size.height * 0.4;
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Column(
        children: [
          Container(
            height: bannerHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
            ),
          ),
          8.verticalSpace,
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
            ),
          ),
          8.verticalSpace,
          Row(
            children: [
              Container(
                width: 50.w,
                height: 15.h,
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
              ),
              5.horizontalSpace,
              Container(
                width: 50.w,
                height: 15.h,
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
