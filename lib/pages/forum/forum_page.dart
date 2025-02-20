import 'package:adam_forum_app/components/forum_card/forum_card.dart';
import 'package:adam_forum_app/model/constant/page_model.dart';
import 'package:adam_forum_app/model/forum_post/post/post_vo.dart';
import 'package:adam_forum_app/model/forum_post/post/request/post_query_request.dart';
import 'package:adam_forum_app/pages/forum/components/top_bar.dart';
import 'package:adam_forum_app/service/forum-post/post_service.dart';
import 'package:adam_forum_app/utils/log_util.dart';
import 'package:adam_forum_app/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:text_divider/text_divider.dart';

/// 论坛页
class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

/// 首页
class _ForumPageState extends State<ForumPage> {
  // 每次加载的条目数
  static const _pageSize = 5;

  final PagingController<int, PostVo> _pagingController =
      PagingController(firstPageKey: 1);

  // 帖子列表
  List<PostVo> postList = [];

  // 是否正在加载
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _loadPostData(pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  // 加载帖子数据
  Future<void> _loadPostData(int pageNum) async {
    try {
      // 创建请求参数
      final request = PostQueryRequest(
        current: pageNum,
        pageSize: _pageSize,
      );

      // 调用服务层方法
      PostService postService = PostService();
      PageModel<PostVo> postVo = await postService.pagePostVO(request);
      bool isLastPage = postVo.records.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(postVo.records);
      } else {
        final nextPageNum = pageNum + postVo.records.length;
        _pagingController.appendPage(postVo.records, nextPageNum);
      }
      // 更新状态
      setState(() {
        postList = postVo.records; // 这里假设接口返回的是单个 PostVo，如果是列表，直接赋值即可
        isLoading = false;
      });
    } catch (e) {
      _pagingController.error = e;
      // 处理异常
      setState(() {
        isLoading = false;
      });
      LogUtils.println('加载帖子数据失败: $e');
      ToastUtils.showErrorMsg('加载帖子数据失败: $e');
    }
  }

  // void _onRefresh() async {
  //   await _loadPostData();
  //   _refreshController.refreshCompleted();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: SmartRefresher(
  //       controller: _refreshController,
  //       onRefresh: _loadPostData,
  //       onLoading: _onRefresh,
  //       child: SingleChildScrollView(
  //         padding: EdgeInsets.all(30.r),
  //         child: Column(
  //           children: [
  //             const TopBar(),
  //             20.verticalSpace,
  //             if (isLoading)
  //               const Center(child: CircularProgressIndicator())
  //             else if (postList.isEmpty)
  //               TextDivider.horizontal(text: const Text('暂无帖子数据'))
  //             else
  //               ...postList.map((postVo) {
  //                 return Padding(
  //                   padding: EdgeInsets.only(bottom: 20.h),
  //                   child: ForumCard(postVo: postVo),
  //                 );
  //               }),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 30),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TopBar(),
                  20.verticalSpace,
                ],
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          onRefresh: () async {
            _pagingController.refresh(); // 刷新数据
          }, // 下拉刷新回调
          child: PagedListView<int, PostVo>.separated(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<PostVo>(
              noItemsFoundIndicatorBuilder: (context) =>
                  const TextDivider(text: Text("暂无数据")),
              noMoreItemsIndicatorBuilder: (context) =>
                  const TextDivider(text: Text("暂无数据")),
              firstPageProgressIndicatorBuilder: (context) =>
                  Center(child: CircularProgressIndicator()),
              newPageProgressIndicatorBuilder: (_) =>
                  Center(child: CircularProgressIndicator()),
              itemBuilder: (context, post, index) => ForumCard(postVo: post),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 20),
          ),
        ),
      ),
    );
  }
}
