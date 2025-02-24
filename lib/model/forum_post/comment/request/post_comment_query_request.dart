class PostCommentQueryRequest {
  int? current;
  int? pageSize;
  String? sortField;
  String? sortOrder;
  int? postId;

  PostCommentQueryRequest({
    this.current,
    this.pageSize,
    this.sortField,
    this.sortOrder,
    this.postId,
  });

  factory PostCommentQueryRequest.fromJson(Map<String, dynamic> json) {
    return PostCommentQueryRequest(
      current: json.containsKey('current') ? json['current'] : null,
      pageSize: json.containsKey('pageSize') ? json['pageSize'] : null,
      sortField: json.containsKey('sortField') ? json['sortField'] : null,
      sortOrder: json.containsKey('sortOrder') ? json['sortOrder'] : null,
      postId: json['postId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (current != null) data['current'] = current;
    if (pageSize != null) data['pageSize'] = pageSize;
    if (sortField != null) data['sortField'] = sortField;
    if (sortOrder != null) data['sortOrder'] = sortOrder;
    if (postId != null) data['postId'] = postId;
    return data;
  }
}
