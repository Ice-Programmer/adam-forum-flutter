import 'package:adam_forum_app/components/cache_image.dart';
import 'package:adam_forum_app/components/custom_button.dart';
import 'package:adam_forum_app/model/forum_post/post/post_vo.dart';
import 'package:adam_forum_app/model/forum_user/user/user_basic_info_bo.dart';
import 'package:adam_forum_app/pages/forum/forum_detail/components/post_top_content/post_user_info_content_skeleton.dart';
import 'package:adam_forum_app/utils/time_util.dart';
import 'package:adam_forum_app/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostUserInfoContent extends StatefulWidget {
  final PostVo? postVo;

  const PostUserInfoContent({super.key, this.postVo});

  @override
  State<PostUserInfoContent> createState() => _PostUserInfoContentState();
}

class _PostUserInfoContentState extends State<PostUserInfoContent> {
  @override
  Widget build(BuildContext context) {
    if (widget.postVo == null) {
      return const PostUserInfoContentSkeleton();
    }
    final bool hasFollow = !widget.postVo!.createUser.hasFollow;
    return Row(
      children: [
        // 用户头像
        CacheImage(
          height: 50.h,
          width: 50.w,
          borderRadius: 15.r,
          imageUrl: widget.postVo!.createUser.userAvatar,
        ),

        10.horizontalSpace,

        // 用户名 & 发帖时间
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.postVo!.createUser.username,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              TimeUtil.formatDateTime(widget.postVo!.createTime),
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const Spacer(),

        // 关注按钮
        CustomButton(
          textColor:
              hasFollow ? Theme.of(context).colorScheme.primary : Colors.white,
          title: hasFollow ? "+ 已关注" : '+ 关注',
          isShadow: false,
          backgroundColor: hasFollow
              ? Colors.transparent
              : Theme.of(context).colorScheme.primary,
          borderColor: hasFollow ? Theme.of(context).colorScheme.primary : null,
          btnWidth: hasFollow ? 100.w : 80.w,
          borderRadius: hasFollow ? 50.r : 40.r,
          btnHeight: 35.h,
          fontSize: 16.sp,
          onPressed: () {
            ToastUtils.showSuccessMsg("关注喵，谢谢喵");
          },
        ),
      ],
    );
  }
}
