/// 帖子点赞请求
class PostThumbRequest {
  int? postId;

  PostThumbRequest({this.postId});

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
    };
  }
}
