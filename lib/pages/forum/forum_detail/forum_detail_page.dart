import 'package:adam_forum_app/components/custom_banner.dart';
import 'package:adam_forum_app/model/forum_post/post/post_vo.dart';
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
          actions: [
            // 收藏键
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star_outline_rounded),
            ),
            // 分享键
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share_rounded),
            ),
            10.horizontalSpace,
          ],
        ),
        body: SafeArea(
          minimum: EdgeInsets.only(left: 30.w, right: 30.w, top: 15.h),
          child: _getBodyUI(),
        ),
      ),
    );
  }

  Widget _getBodyUI() {
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
        ],
      ),
    );
  }
}
