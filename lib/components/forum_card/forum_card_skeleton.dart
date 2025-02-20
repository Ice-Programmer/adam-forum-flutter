import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForumCardSkeleton extends StatelessWidget {
  const ForumCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.r, right: 15.r, top: 15.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.03),
            offset: Offset(0, 5.h),
            blurRadius: 10.r,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          _getTopInfo(context),
          5.verticalSpace,
          _getContentInfo(context),
          _getBottomInfo(context),
        ],
      ),
    );
  }

  /// 骨架屏顶部栏
  Widget _getTopInfo(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getAuthorInfo(context),
          IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.more_horiz_rounded,
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
            ),
          ),
        ],
      ),
    );
  }

  /// 骨架屏作者信息
  Widget _getAuthorInfo(BuildContext context) {
    return Row(
      children: [
        // 头像骨架
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
          highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        10.horizontalSpace,

        // 用户名和账号骨架
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户名骨架
            Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
              highlightColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Container(
                width: 120.w,
                height: 12.h,
                color: Colors.white,
              ),
            ),
            5.verticalSpace,

            // 账号骨架
            Shimmer.fromColors(
              baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
              highlightColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Container(
                width: 100.w,
                height: 10.h,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// 骨架屏主体内容
  Widget _getContentInfo(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 帖子标题骨架
          Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
            highlightColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Container(
              width: 200.w,
              height: 14.h,
              color: Colors.white,
            ),
          ),

          5.verticalSpace,

          // 帖子封面骨架
          Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
            highlightColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Container(
              width: double.infinity,
              height: 150.h,
              color: Colors.white,
            ),
          ),

          5.verticalSpace,

          // 帖子时间地点骨架
          Row(
            children: [
              // 时间骨架
              Shimmer.fromColors(
                baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
                highlightColor:
                    Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Container(
                  width: 80.w,
                  height: 10.h,
                  color: Colors.white,
                ),
              ),
              10.horizontalSpace,

              // 地点骨架
              Flexible(
                child: Shimmer.fromColors(
                  baseColor:
                      Theme.of(context).colorScheme.surfaceContainerLowest,
                  highlightColor:
                      Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Container(
                    width: 100.w,
                    height: 10.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 骨架屏底部信息栏
  Widget _getBottomInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 点赞按钮骨架
        _buildIconButton(context),

        // 收藏按钮骨架
        _buildIconButton(context),

        // 评论按钮骨架
        _buildIconButton(context),

        // 分享按钮骨架
        IconButton(
          icon: Icon(
            Icons.share,
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            size: 22.sp,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  /// 骨架屏图标按钮
  Widget _buildIconButton(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildShimmerIcon(context),
        5.horizontalSpace,
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
          highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Container(
            width: 30.w,
            height: 10.h,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  /// 骨架屏图标
  Widget _buildShimmerIcon(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Container(
        width: 26.sp,
        height: 26.sp,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
