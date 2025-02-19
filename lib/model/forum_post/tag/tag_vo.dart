class TagVo {
  String id;
  String userId;
  String name;

  TagVo({
    required this.id,
    required this.userId,
    required this.name,
  });

  // 从 JSON 数据创建 TagVo 实例
  TagVo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        name = json['name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['userId'] = userId;
    data['name'] = name;
    return data;
  }
}
