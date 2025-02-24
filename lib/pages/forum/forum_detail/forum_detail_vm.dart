import 'package:adam_forum_app/model/forum_post/comment/post_comment_vo.dart';
import 'package:adam_forum_app/model/forum_post/comment/request/post_comment_query_request.dart';
import 'package:adam_forum_app/model/forum_post/post/post_vo.dart';
import 'package:adam_forum_app/service/forum-post/post_service.dart';
import 'package:adam_forum_app/service/forum-post/post_comment_service.dart';
import 'package:adam_forum_app/utils/log_util.dart';
import 'package:flutter/material.dart';

class ForumDetailViewModel extends ChangeNotifier {
  final PostService _postService = PostService();
  final PostCommentService _commentService = PostCommentService();

  // 帖子详情
  PostVo? _postVo;

  PostVo? get postVo => _postVo;

  // 评论列表
  final List<PostCommentVo> _comments = [];

  List<PostCommentVo> get comments => _comments;

  // 分页状态
  bool _isLoadingComments = false;

  bool get isLoadingComments => _isLoadingComments;

  bool _hasMoreComments = true;

  bool get hasMoreComments => _hasMoreComments;

  int _currentCommentPage = 1;
  final PostCommentQueryRequest _commentRequest =
      PostCommentQueryRequest(pageSize: 10);

  /// 获取帖子详情
  Future<void> fetchPost(int postId) async {
    _postVo = await _postService.getPostVO(postId);
    notifyListeners();
  }

  /// 加载评论
  Future<void> loadComments(int postId) async {
    if (_isLoadingComments || !_hasMoreComments) return;

    _isLoadingComments = true;
    notifyListeners();

    try {
      _commentRequest.current = _currentCommentPage;
      _commentRequest.postId = postId;
      final page = await _commentService.pagePostCommentVO(_commentRequest);
      _comments.addAll(page.records);
      _hasMoreComments = _comments.length < int.parse(page.total);
      _currentCommentPage++;
    } catch (e) {
      debugPrint('加载评论失败: $e');
    } finally {
      _isLoadingComments = false;
      notifyListeners();
    }
  }

  /// 重置评论状态
  void resetComments() {
    _comments.clear();
    _currentCommentPage = 1;
    _hasMoreComments = true;
    _isLoadingComments = false;
    notifyListeners();
  }
}
