import 'package:adam_forum_app/model/forum_post/post/post_vo.dart';
import 'package:adam_forum_app/pages/forum/forum_detail/components/post_bottom_bar/post_bottom_bar.dart';
import 'package:adam_forum_app/pages/forum/forum_detail/components/post_comment/post_comment_content.dart';
import 'package:adam_forum_app/pages/forum/forum_detail/components/post_comment/post_comment_content_skeleton.dart';
import 'package:adam_forum_app/pages/forum/forum_detail/components/post_content/post_content.dart';
import 'package:adam_forum_app/pages/forum/forum_detail/forum_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'components/post_top_content/post_user_info_content.dart';

class ForumDetailPage extends StatefulWidget {
  final int postId;

  const ForumDetailPage({super.key, required this.postId});

  @override
  State<ForumDetailPage> createState() => _ForumDetailPageState();
}

class _ForumDetailPageState extends State<ForumDetailPage> {
  final ForumDetailViewModel _viewModel = ForumDetailViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchPost(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            // 收藏键
            // 分享键
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share_rounded),
              color: Colors.grey.shade600,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
              color: Colors.grey.shade600,
            ),
            10.horizontalSpace,
          ],
        ),
        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 30.w),
          bottom: false,
          child: _getBodyUI(),
        ),
        bottomNavigationBar: Selector<ForumDetailViewModel, PostVo?>(
          builder: (context, postVo, child) {
            return postVo != null
                ? PostBottomBar(postVo: postVo)
                : const SizedBox.shrink();
          },
          selector: (_, viewModel) => viewModel.postVo,
        ),
      ),
    );
  }

  Widget _getBodyUI() {
    final bool isDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SingleChildScrollView(
      child: Column(
        children: [
          // 顶部用户信息
          Selector<ForumDetailViewModel, PostVo?>(
            builder: (context, postVo, child) {
              return PostUserInfoContent(postVo: postVo);
            },
            selector: (_, viewModel) => viewModel.postVo,
          ),

          8.verticalSpace,

          // 帖子主题内容
          Selector<ForumDetailViewModel, PostVo?>(
            builder: (context, postVo, child) {
              return PostContent(postVo: postVo);
            },
            selector: (_, viewModel) => viewModel.postVo,
          ),

          6.verticalSpace,

          Divider(
            color: isDark ? Colors.grey.shade900 : Colors.grey.shade200,
          ),

          6.verticalSpace,

          // 帖子主题内容
          Selector<ForumDetailViewModel, PostVo?>(
            builder: (context, postVo, child) {
              if (postVo == null) {
                return const PostCommentContentSkeleton();
              }
              return PostCommentContent(postVo: postVo);
            },
            selector: (_, viewModel) => viewModel.postVo,
          )
        ],
      ),
    );
  }
}
