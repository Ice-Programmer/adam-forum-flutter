class PostFavourRequest {
  int? postId;

  PostFavourRequest({this.postId});

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
    };
  }
}