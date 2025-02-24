import 'package:adam_forum_app/components/animated_icon_button.dart';
import 'package:adam_forum_app/model/forum_post/post/post_vo.dart';
import 'package:adam_forum_app/model/forum_post/post/request/post_favour_request.dart';
import 'package:adam_forum_app/model/forum_post/post/request/post_thumb_request.dart';
import 'package:adam_forum_app/pages/forum/forum_detail/components/post_bottom_bar/bottom_chat_input.dart';
import 'package:adam_forum_app/service/forum-post/post_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostBottomBar extends StatefulWidget {
  final PostVo postVo;

  const PostBottomBar({super.key, required this.postVo});

  @override
  State<PostBottomBar> createState() => _PostBottomBarState();
}

class _PostBottomBarState extends State<PostBottomBar> {
  final PostService _postService = PostService();
  bool _isLiked = false;
  int _likeNum = 0;
  bool _isStar = false;
  int _starNum = 0;

  @override
  void initState() {
    super.initState();
      _isLiked = widget.postVo.hasThumb;
      _isStar = widget.postVo.hasFavour;
      _likeNum = widget.postVo.thumbNum;
      _starNum = widget.postVo.favourNum;
  }

  /// 点赞请求
  Future<void> _doThumb() async {
    PostThumbRequest request =
        PostThumbRequest(postId: int.parse(widget.postVo.id));
    int status = await _postService.doThumb(request);
    setState(() {
      _isLiked = !_isLiked;
      if (status == 1) {
        _likeNum = _likeNum + 1;
      } else if (status == -1) {
        _likeNum = _likeNum - 1;
      }
    });
  }

  /// 收藏请求
  Future<void> _doStar() async {
    PostFavourRequest request =
        PostFavourRequest(postId: int.parse(widget.postVo.id));
    int status = await _postService.doFavour(request);
    setState(() {
      _isStar = !_isStar;
      if (status == 1) {
        _starNum = _starNum + 1;
      } else if (status == -1) {
        _starNum = _starNum - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(right: 22.w, left: 22.w, bottom: 18.h),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.surfaceContainer
          ),
        ),
      ),
      child: Row(
        children: [
          // 评论框
          const Expanded(
            child: BottomChatInput(),
          ),

          10.horizontalSpace,

          _buildIconButton(
            icon: AnimatedIconButton(
              iconSize: 28.sp,
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

          // 收藏按钮
          _buildIconButton(
            icon: AnimatedIconButton(
              iconSize: 28.sp,
              isSelected: _isStar,
              selectedIcon: Icons.star_outlined,
              unselectedIcon: Icons.star_outline_rounded,
              selectedColor: Colors.amber,
              unselectedColor: Colors.grey,
              onPressed: _doStar,
              startY: 20,
            ),
            text: _starNum.toString(),
          ),
        ],
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
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
