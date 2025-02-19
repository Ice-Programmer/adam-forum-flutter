import 'package:adam_forum_app/model/forum_post/tag/tag_vo.dart';
import 'package:adam_forum_app/model/forum_user/user/user_basic_info_bo.dart';

class PostVo {
  final String id;
  final String title;
  final String content;
  final String address;
  final int thumbNum;
  final int favourNum;
  final int commentNum;
  final List<TagVo> tagList;
  final List<String> imageList;
  final int coverIndex;
  final UserBasicInfoBo createUser;
  final bool hasFavour;
  final bool hasThumb;
  final String createTime;

  PostVo({
    required this.id,
    required this.title,
    required this.content,
    required this.address,
    required this.thumbNum,
    required this.favourNum,
    required this.commentNum,
    required this.tagList,
    required this.imageList,
    required this.coverIndex,
    required this.createUser,
    required this.hasFavour,
    required this.hasThumb,
    required this.createTime,
  });

  // 从 JSON 创建 Post 实例
  factory PostVo.fromJson(Map<String, dynamic> json) {
    return PostVo(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      address: json['address'],
      thumbNum: json['thumbNum'],
      favourNum: json['favourNum'],
      commentNum: json['commentNum'],
      tagList:
          (json['tagList'] as List).map((tag) => TagVo.fromJson(tag)).toList(),
      imageList: List<String>.from(json['imageList']),
      coverIndex: json['coverIndex'],
      createUser: UserBasicInfoBo.fromJson(json['createUser']),
      hasFavour: json['hasFavour'],
      hasThumb: json['hasThumb'],
      createTime: json['createTime'],
    );
  }

  // 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'address': address,
      'thumbNum': thumbNum,
      'favourNum': favourNum,
      'commentNum': commentNum,
      'tagList': tagList.map((tag) => tag.toJson()).toList(),
      'imageList': imageList,
      'coverIndex': coverIndex,
      'createUser': createUser.toJson(),
      'hasFavour': hasFavour,
      'hasThumb': hasThumb,
      'createTime': createTime,
    };
  }
}
