class UserBasicInfoVo {
  String id;
  String username;
  String userAvatar;
  String? phone;
  String? email;
  String userRole;

  UserBasicInfoVo({
    required this.id,
    required this.username,
    required this.userAvatar,
    this.phone,
    this.email,
    required this.userRole,
  });

  // UserBasicInfoVo.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   username = json['username'];
  //   userAvatar = json['userAvatar'];
  //   phone = json['phone'];
  //   email = json['email'];
  //   userRole = json['userRole'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    data['userAvatar'] = userAvatar;
    data['phone'] = phone;
    data['email'] = email;
    data['userRole'] = userRole;
    return data;
  }
}
