class PostQueryRequest {
  int? current;
  int? pageSize;
  String? sortField;
  String? sortOrder;
  int? id;
  List<int>? ids;
  String? searchText;
  String? title;
  String? content;
  String? address;
  int? userId;
  List<int>? tagIdList;

  PostQueryRequest({
    this.current,
    this.pageSize,
    this.sortField,
    this.sortOrder,
    this.id,
    this.ids,
    this.searchText,
    this.title,
    this.content,
    this.address,
    this.userId,
    this.tagIdList,
  });

  factory PostQueryRequest.fromJson(Map<String, dynamic> json) {
    return PostQueryRequest(
      current: json.containsKey('current') ? json['current'] : null,
      pageSize: json.containsKey('pageSize') ? json['pageSize'] : null,
      sortField: json.containsKey('sortField') ? json['sortField'] : null,
      sortOrder: json.containsKey('sortOrder') ? json['sortOrder'] : null,
      id: json['id'],
      ids: json['ids'] != null ? List<int>.from(json['ids']) : null,
      searchText: json['searchText'],
      title: json['title'],
      content: json['content'],
      address: json['address'],
      userId: json['userId'],
      tagIdList: json['tagIdList'] != null ? List<int>.from(json['tagIdList']) : null,
    );
  }

  // 可选：添加一个方法将对象转换为 JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (current != null) data['current'] = current;
    if (pageSize != null) data['pageSize'] = pageSize;
    if (sortField != null) data['sortField'] = sortField;
    if (sortOrder != null) data['sortOrder'] = sortOrder;
    if (id != null) data['id'] = id;
    if (ids != null) data['ids'] = ids;
    if (searchText != null) data['searchText'] = searchText;
    if (title != null) data['title'] = title;
    if (content != null) data['content'] = content;
    if (address != null) data['address'] = address;
    if (userId != null) data['userId'] = userId;
    if (tagIdList != null) data['tagIdList'] = tagIdList;
    return data;
  }
}
