/// 评论点赞请求
class PostCommentThumbRequest {
  int firstCommentId;
  int? secondCommentId;

  PostCommentThumbRequest({required this.firstCommentId, this.secondCommentId});

  Map<String, dynamic> toJson() {
    return {
      'firstCommentId': firstCommentId,
      'secondCommentId': secondCommentId,
    };
  }
}
