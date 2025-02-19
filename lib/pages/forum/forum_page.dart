import 'package:adam_forum_app/components/forum_card/forum_card.dart';
import 'package:adam_forum_app/model/forum_post/post/post_vo.dart';
import 'package:adam_forum_app/pages/forum/components/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final jsonData = {
  "id": "1881684926699560962",
  "title": "今天是个好天气",
  "content": "今日、いい天気です",
  "address": "浙江省-杭州市-钱塘区-杭州电子科技大学",
  "thumbNum": 0,
  "favourNum": 0,
  "commentNum": 3,
  "tagList": [
    {
      "id": "1881684723925934081",
      "userId": "1880504632369938433",
      "name": "天气"
    },
    {"id": "1881684888741109762", "userId": "1880504632369938433", "name": "日语"}
  ],
  "imageList": [
    "https://ice-man-1316749988.cos.ap-shanghai.myqcloud.com/imgs/image-20241006190310627.png",
  ],
  "coverIndex": 1,
  "createUser": {
    "id": "1880504632369938433",
    "username": "IceMan",
    "account": "iceman",
    "gender": 0,
    "userAvatar":
        "https://ice-man-1316749988.cos.ap-shanghai.myqcloud.com/imgs/%E5%85%AB%E5%A5%88%E8%A6%8B.jpg",
    "userRole": "user"
  },
  "hasFavour": false,
  "hasThumb": false,
  "createTime": "2025-01-21T12:47:01.000+00:00",
};
final PostVo postVo = PostVo.fromJson(jsonData);

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

/// 首页
class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(30.r),
        child: Column(
          children: [
            const TopBar(),
            50.verticalSpace,
            ForumCard(postVo: postVo),
            50.verticalSpace,
            ForumCard(postVo: postVo),
          ],
        ),
      ),
    );
  }
}
