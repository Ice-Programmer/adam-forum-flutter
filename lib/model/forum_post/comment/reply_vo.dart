import 'package:adam_forum_app/model/forum_user/user/user_basic_info_bo.dart';

// 评论回复类
class ReplyVo {
  String id;
  UserBasicInfoBo createUser;
  String? replyId;
  String content;
  String? image;
  int thumbNum;
  bool hasThumb;
  String createTime;

  ReplyVo({
    required this.id,
    required this.createUser,
    this.replyId,
    required this.content,
    required this.image,
    required this.thumbNum,
    required this.hasThumb,
    required this.createTime,
  });

  factory ReplyVo.fromJson(Map<String, dynamic> json) {
    return ReplyVo(
      id: json['id'],
      createUser: UserBasicInfoBo.fromJson(json['createUser']),
      replyId: json['replyId'],
      content: json['content'],
      image: json['image'],
      thumbNum: json['thumbNum'],
      hasThumb: json['hasThumb'],
      createTime: json['createTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createUser': createUser.toJson(),
      'replyId': replyId,
      'content': content,
      'image': image,
      'thumbNum': thumbNum,
      'hasThumb': hasThumb,
      'createTime': createTime,
    };
  }
}
