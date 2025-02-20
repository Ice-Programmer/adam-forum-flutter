import 'package:adam_forum_app/components/cache_image.dart';
import 'package:adam_forum_app/components/animated_icon_button.dart';
import 'package:adam_forum_app/model/forum_post/post/post_vo.dart';
import 'package:adam_forum_app/utils/time_util.dart';
import 'package:adam_forum_app/utils/toast_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForumCard extends StatefulWidget {
  final PostVo postVo;

  const ForumCard({super.key, required this.postVo});

  @override
  State<ForumCard> createState() => _ForumCardState();
}

class _ForumCardState extends State<ForumCard> {
  bool _isLiked = false;
  bool _isStar = false;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.postVo.hasThumb;
    _isStar = widget.postVo.hasFavour;
  }

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
          _getTopInfo(),
          5.verticalSpace,
          _getContentInfo(context),
          _getBottomInfo(context),
        ],
      ),
    );
  }

  /// 卡片顶部栏信息
  Widget _getTopInfo() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getAuthorInfo(),
          IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.more_horiz_rounded),
          ),
        ],
      ),
    );
  }

  Widget _getAuthorInfo() {
    return Row(
      children: [
        // 头像
        CacheImage(
          height: 40.h,
          width: 40.w,
          borderRadius: 20.r,
          imageUrl: widget.postVo.createUser.userAvatar,
        ),

        10.horizontalSpace,

        // 创作者信息
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.postVo.createUser.username,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '@${widget.postVo.createUser.account}',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// 卡片主体部分
  Widget _getContentInfo(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 帖子标题
          Text(
            widget.postVo.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),

          5.verticalSpace,

          // 帖子封面
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              maxHeightDiskCache: 500,
              imageUrl: widget.postVo.imageList[widget.postVo.coverIndex - 1],
            ),
          ),

          5.verticalSpace,

          // 帖子时间地点
          Row(
            children: [
              Text(
                TimeUtil.format(widget.postVo.createTime),
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w600,
                ),
              ),
              10.horizontalSpace,
              Flexible(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    widget.postVo.address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF5B6A92),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  /// 底部信息栏
  /// 底部信息栏
  Widget _getBottomInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 点赞按钮
        _buildIconButton(
          icon: AnimatedIconButton(
            iconSize: 26.sp,
            isSelected: _isLiked,
            selectedIcon: Icons.favorite,
            unselectedIcon: Icons.favorite_outline_rounded,
            unselectedAnimateIcon: Icons.heart_broken_rounded,
            selectedColor: Colors.red,
            unselectedColor: Colors.grey,
            onPressed: () => setState(() {
              _isLiked = !_isLiked;
            }),
          ),
          text: widget.postVo.thumbNum.toString(),
        ),

        // 收藏按钮
        _buildIconButton(
          icon: AnimatedIconButton(
            iconSize: 26.sp,
            isSelected: _isStar,
            selectedIcon: Icons.star_outlined,
            unselectedIcon: Icons.star_outline_rounded,
            selectedColor: Colors.amber,
            unselectedColor: Colors.grey,
            onPressed: () => setState(() => _isStar = !_isStar),
          ),
          text: widget.postVo.favourNum.toString(),
        ),

        // 评论按钮
        _buildIconButton(
          icon: IconButton(
            icon: Icon(Icons.chat_rounded, color: Colors.grey, size: 22.sp),
            onPressed: () => ToastUtils.showInfoMsg("评论点击"),
          ),
          text: widget.postVo.commentNum.toString(),
        ),

        // 分享按钮
        IconButton(
          icon: Icon(Icons.share, color: Colors.grey, size: 22.sp),
          onPressed: () => ToastUtils.showInfoMsg("分享点击"),
        ),
      ],
    );
  }

  /// 带文字和图标的自定义按钮
  Widget _buildIconButton({required Widget icon, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
