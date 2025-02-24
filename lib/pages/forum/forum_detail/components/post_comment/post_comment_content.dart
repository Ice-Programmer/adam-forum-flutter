import 'package:adam_forum_app/components/post_comment_card/post_comment_card.dart';
import 'package:adam_forum_app/components/post_comment_card/post_comment_card_skeleton.dart';
import 'package:adam_forum_app/model/constant/page_model.dart';
import 'package:adam_forum_app/model/forum_post/comment/post_comment_vo.dart';
import 'package:adam_forum_app/model/forum_post/comment/request/post_comment_query_request.dart';
import 'package:adam_forum_app/model/forum_post/post/post_vo.dart';
import 'package:adam_forum_app/service/forum-post/post_comment_service.dart';
import 'package:adam_forum_app/utils/log_util.dart';
import 'package:adam_forum_app/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostCommentContent extends StatefulWidget {
  final PostVo postVo;

  const PostCommentContent({super.key, required this.postVo});

  @override
  State<PostCommentContent> createState() => _PostCommentContentState();
}

class _PostCommentContentState extends State<PostCommentContent> {
  // 每次加载的条目数
  static const _pageSize = 8;

  final PagingController<int, PostCommentVo> _pagingController =
      PagingController(firstPageKey: 1);

  // 是否正在加载
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _loadCommentData(pageKey);
    });
  }

  // 加载评论数据
  Future<void> _loadCommentData(int pageNum) async {
    try {
      // 创建请求参数
      final request = PostCommentQueryRequest(
        current: pageNum,
        pageSize: _pageSize,
        postId: int.parse(widget.postVo.id),
      );

      // 调用服务层方法
      PostCommentService commentService = PostCommentService();
      PageModel<PostCommentVo> commentPage =
          await commentService.pagePostCommentVO(request);
      bool isLastPage = commentPage.records.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(commentPage.records);
      } else {
        final nextPageNum = pageNum + commentPage.records.length;
        _pagingController.appendPage(commentPage.records, nextPageNum);
      }
      // 更新状态
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      _pagingController.error = e;
      // 处理异常
      setState(() {
        isLoading = false;
      });
      LogUtils.println('加载帖子评论数据失败: $e');
      ToastUtils.showErrorMsg('加载帖子评论数据失败: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getBody(),
        8.verticalSpace,
        PagedListView<int, PostCommentVo>.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<PostCommentVo>(
            noItemsFoundIndicatorBuilder: (context) => Container(),
            firstPageProgressIndicatorBuilder: (context) =>
                const PostCommentCardSkeleton(),
            newPageProgressIndicatorBuilder: (_) =>
                const PostCommentCardSkeleton(),
            itemBuilder: (context, commentVo, index) =>
                PostCommentCard(postCommentVo: commentVo),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 20),
        ),
      ],
    );
  }

  Widget _getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 标题
        _getCommentTitle(),

        10.verticalSpace,
      ],
    );
  }

  Widget _getCommentTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "评论",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        4.horizontalSpace,
        // 评论数
        Text(
          "(${widget.postVo.commentNum})",
          style: TextStyle(fontSize: 18.sp),
        )
      ],
    );
  }
}
