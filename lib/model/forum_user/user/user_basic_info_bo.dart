class UserBasicInfoBo {
  String id;
  String username;
  String account;
  int gender;
  String userAvatar;
  String userRole;

  UserBasicInfoBo({
    required this.id,
    required this.username,
    required this.account,
    required this.gender,
    required this.userAvatar,
    required this.userRole,
  });

  factory UserBasicInfoBo.fromJson(Map<String, dynamic> json) {
    return UserBasicInfoBo(
      id: json['id'],
      username: json['username'],
      account: json['account'],
      gender: json['gender'],
      userAvatar: json['userAvatar'],
      userRole: json['userRole'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'account': account,
      'gender': gender,
      'userAvatar': userAvatar,
      'userRole': userRole,
    };
  }
}