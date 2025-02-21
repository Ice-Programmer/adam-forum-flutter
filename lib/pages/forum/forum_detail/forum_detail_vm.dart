import 'package:adam_forum_app/model/forum_post/post/post_vo.dart';
import 'package:adam_forum_app/service/forum-post/post_service.dart';
import 'package:flutter/material.dart';

class ForumDetailViewModel extends ChangeNotifier {
  final PostService _postService = PostService();
  PostVo? _postVo;

  PostVo? get postVo => _postVo;

  Future<void> fetchPost(int postId) async {
    _postVo = await _postService.getPostVO(postId);
    notifyListeners();
  }
}
