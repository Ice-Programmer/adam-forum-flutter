import 'package:adam_forum_app/components/animated_icon_button.dart';
import 'package:adam_forum_app/components/cache_image.dart';
import 'package:adam_forum_app/components/post_comment_card/post_comment_reply_card.dart';
import 'package:adam_forum_app/model/forum_post/comment/post_comment_vo.dart';
import 'package:adam_forum_app/model/forum_post/comment/request/post_comment_thumb_request.dart';
import 'package:adam_forum_app/service/forum-post/post_comment_service.dart';
import 'package:adam_forum_app/utils/time_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_divider/text_divider.dart';

class PostCommentCard extends StatefulWidget {
  final PostCommentVo postCommentVo;

  const PostCommentCard({super.key, required this.postCommentVo});

  @override
  State<PostCommentCard> createState() => _PostCommentCardState();
}

class _PostCommentCardState extends State<PostCommentCard> {
  final PostCommentService _commentService = PostCommentService();
  bool _isLiked = false;
  int _likeNum = 0;
  bool _more = true;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.postCommentVo.hasThumb;
    _likeNum = widget.postCommentVo.thumbNum;
    _more = !(widget.postCommentVo.replyList.isNotEmpty &&
        widget.postCommentVo.replyList.length >= 2);
  }

  /// 点赞请求
  Future<void> _doThumb() async {
    PostCommentThumbRequest request = PostCommentThumbRequest(
      firstCommentId: int.parse(widget.postCommentVo.id),
    );
    int status = await _commentService.doThumb(request);
    setState(() {
      _isLiked = !_isLiked;
      if (status == 1) {
        _likeNum = _likeNum + 1;
      } else if (status == -1) {
        _likeNum = _likeNum - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 用户头像
        CacheImage(
          height: 40.h,
          width: 40.w,
          borderRadius: 20.r,
          imageUrl: widget.postCommentVo.createUser.userAvatar,
        ),

        10.horizontalSpace,

        // 内容
        _getContent(),
      ],
    );
  }

  // 评论用户相关信息
  Widget _getContent() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getAuthorInfo(),
          Text(
            widget.postCommentVo.content,
            style: TextStyle(fontSize: 14.sp),
          ),

          4.verticalSpace,

          if (widget.postCommentVo.image != null)
            FractionallySizedBox(
              widthFactor: 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CacheImage(
                  maxHeight: 180.h,
                  imageUrl: widget.postCommentVo.image!,
                  canView: true,
                ),
              ),
            ),

          4.verticalSpace,

          // 回复按钮
          _getReplyButton(),

          _getReplyList(),
        ],
      ),
    );
  }

  // 回复按钮
  Widget _getReplyButton() {
    return InkWell(
      onTap: () {},
      child: Text(
        "回复",
        style: TextStyle(
          color: Colors.grey.shade500,
        ),
      ),
    );
  }

  Widget _getAuthorInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户名
            Text(
              widget.postCommentVo.createUser.username,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            3.verticalSpace,
            // 发帖时间
            Text(
              TimeUtil.formatDateTime(widget.postCommentVo.createTime),
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        const Spacer(),
        _buildIconButton(
          icon: AnimatedIconButton(
            iconSize: 26.sp,
            isSelected: _isLiked,
            selectedIcon: Icons.favorite,
            unselectedIcon: Icons.favorite_outline_rounded,
            unselectedAnimateIcon: Icons.heart_broken_rounded,
            selectedColor: Colors.red,
            unselectedColor: Colors.grey,
            onPressed: _doThumb,
            startY: 20,
          ),
          text: _likeNum.toString(),
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
        4.horizontalSpace,
      ],
    );
  }

  Widget _getReplyList() {
    if (widget.postCommentVo.replyList.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.postCommentVo.replyList.length,
            itemBuilder: (context, index) {
              if (index < 1 || _more) {
                return Column(
                  children: [
                    10.verticalSpace,
                    PostCommentReplyCard(
                      commentId: int.parse(widget.postCommentVo.id),
                      replyVo: widget.postCommentVo.replyList[index],
                    ),
                  ],
                );
              }
              return null;
            },
          ),
          if (!_more)
            InkWell(
              onTap: () {
                setState(() {
                  _more = !_more;
                });
              },
              child: TextDivider.horizontal(
                color: Colors.grey.shade600,
                text: Text(
                  "查看 ${widget.postCommentVo.replyList.length - 1} 条更多评论",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
            )
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
