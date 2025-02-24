import 'package:adam_forum_app/components/animated_icon_button.dart';
import 'package:adam_forum_app/components/cache_image.dart';
import 'package:adam_forum_app/model/forum_post/comment/reply_vo.dart';
import 'package:adam_forum_app/model/forum_post/comment/request/post_comment_thumb_request.dart';
import 'package:adam_forum_app/service/forum-post/post_comment_service.dart';
import 'package:adam_forum_app/utils/time_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCommentReplyCard extends StatefulWidget {
  final int commentId;
  final ReplyVo replyVo;

  const PostCommentReplyCard(
      {super.key, required this.replyVo, required this.commentId});

  @override
  State<PostCommentReplyCard> createState() => _PostCommentReplyCardState();
}

class _PostCommentReplyCardState extends State<PostCommentReplyCard> {
  final PostCommentService _commentService = PostCommentService();

  bool _isLiked = false;
  int _likeNum = 0;

  /// 点赞请求
  Future<void> _doThumb() async {
    PostCommentThumbRequest request = PostCommentThumbRequest(
      firstCommentId: widget.commentId,
      secondCommentId: int.parse(widget.replyVo.id),
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
  void initState() {
    super.initState();
    _isLiked = widget.replyVo.hasThumb;
    _likeNum = widget.replyVo.thumbNum;
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
          imageUrl: widget.replyVo.createUser.userAvatar,
        ),

        10.horizontalSpace,

        // 内容
        _getContent(),

        _buildIconButton(
          icon: AnimatedIconButton(
            iconSize: 26.sp,
            isSelected: _isLiked,
            selectedIcon: Icons.favorite,
            unselectedIcon: Icons.favorite_outline_rounded,
            unselectedAnimateIcon: Icons.heart_broken_rounded,
            selectedColor: Colors.red,
            unselectedColor: Colors.grey,
            startY: 20,
            onPressed: _doThumb,
          ),
          text: _likeNum.toString(),
        ),
      ],
    );
  }

  // 评论用户相关信息
  Widget _getContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 用户名
          Text(
            widget.replyVo.createUser.username,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),

          // 发帖时间
          Text(
            TimeUtil.formatDateTime(widget.replyVo.createTime),
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12.sp,
            ),
          ),

          if (widget.replyVo.image != null)
            FractionallySizedBox(
              widthFactor: 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CacheImage(
                  maxHeight: 180.h,
                  imageUrl: widget.replyVo.image!,
                  canView: true,
                ),
              ),
            ),


          2.verticalSpace,

          Text(
            widget.replyVo.content,
            style: TextStyle(fontSize: 14.sp),
          ),

          4.verticalSpace,

          // 回复按钮
          _getReplyButton(),
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
}
