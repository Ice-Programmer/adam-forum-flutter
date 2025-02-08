import 'package:adam_forum_app/components/cache_image.dart';
import 'package:adam_forum_app/components/custom_button.dart';
import 'package:adam_forum_app/components/custom_input.dart';
import 'package:adam_forum_app/model/forum_user/user/user_basic_info_vo.dart';
import 'package:adam_forum_app/pages/forum/components/top_search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 假数据
final UserBasicInfoVo currentUserInfo = UserBasicInfoVo(
  id: "1",
  username: "IceMan",
  userAvatar:
      "https://ice-man-1316749988.cos.ap-shanghai.myqcloud.com/imgs/%E5%85%AB%E5%A5%88%E8%A6%8B.jpg",
  userRole: "user",
);

/// 顶部栏
class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getUserAvatarInfo(context),
          _getIconList(context),
        ],
      ),
    );
  }

  Widget _getUserAvatarInfo(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 头像
        CacheImage(
          height: 50.h,
          width: 50.h,
          borderRadius: 12.r,
          imageUrl: currentUserInfo.userAvatar,
        ),

        15.horizontalSpace,

        // 个人信息
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "早上好",
              style: TextStyle(
                fontSize: 12.sp,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Text(
              currentUserInfo.username,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _getIconList(BuildContext context) {
    return Row(
      children: [
        const TopSearchButton(),
        CustomButton(
          icon: Icons.notifications_none_rounded,
          onPressed: () {},
          textColor: Theme.of(context).colorScheme.tertiary,
          btnWidth: 50.w,
          borderRadius: 25.r,
          btnHeight: 50.h,
          fontSize: 19.sp,
        ),
      ],
    );
  }
}
