import 'package:adam_forum_app/components/custom_banner.dart';
import 'package:adam_forum_app/model/forum_post/post/post_vo.dart';
import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  final PostVo? postVo;

  const PostContent({super.key, this.postVo});

  @override
  Widget build(BuildContext context) {
    if (postVo == null) {
      return const Placeholder();
    }
    return Column(
      children: [
        // 图片轮播图
        CustomBanner(
          bannerList: postVo!.imageList,
          boxFit: BoxFit.cover,
          initialIndex: postVo!.coverIndex - 1,
        ),


      ],
    );
  }
}
