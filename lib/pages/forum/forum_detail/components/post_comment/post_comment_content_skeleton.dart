import 'package:adam_forum_app/components/post_comment_card/post_comment_card_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PostCommentContentSkeleton extends StatelessWidget {
  const PostCommentContentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 25.h,
                width: 44.w,
                color: Colors.white,
              ),
              5.horizontalSpace,
              Container(
                height: 15.h,
                width: 25.w,
                color: Colors.white,
              ),
            ],
          ),
          10.verticalSpace,
          const PostCommentCardSkeleton(),
          10.verticalSpace,
          const PostCommentCardSkeleton(),
        ],
      ),
    );
  }
}
