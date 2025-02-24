import 'package:adam_forum_app/model/forum_post/comment/reply_vo.dart';
import 'package:adam_forum_app/model/forum_user/user/user_basic_info_bo.dart';

class PostCommentVo {
  String id;
  UserBasicInfoBo createUser;
  String content;
  String? image;
  int thumbNum;
  bool hasThumb;
  String createTime;
  List<ReplyVo> replyList;

  PostCommentVo({
    required this.id,
    required this.createUser,
    required this.content,
    this.image,
    required this.thumbNum,
    required this.hasThumb,
    required this.createTime,
    required this.replyList,
  });

  factory PostCommentVo.fromJson(Map<String, dynamic> json) {
    return PostCommentVo(
      id: json['id'],
      createUser: UserBasicInfoBo.fromJson(json['createUser']),
      content: json['content'],
      image: json['image'],
      thumbNum: json['thumbNum'],
      hasThumb: json['hasThumb'],
      createTime: json['createTime'],
      replyList: List<ReplyVo>.from(json['replyList'].map((x) => ReplyVo.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createUser': createUser.toJson(),
      'content': content,
      'image': image,
      'thumbNum': thumbNum,
      'hasThumb': hasThumb,
      'createTime': createTime,
      'replyList': List<dynamic>.from(replyList.map((x) => x.toJson())),
    };
  }
}