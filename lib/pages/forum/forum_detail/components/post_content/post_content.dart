import 'package:adam_forum_app/components/custom_banner.dart';
import 'package:adam_forum_app/components/expandable_markdown.dart';
import 'package:adam_forum_app/components/tag_wrap_show.dart';
import 'package:adam_forum_app/model/forum_post/post/post_vo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textfield_tags/textfield_tags.dart';

class PostContent extends StatefulWidget {
  final PostVo? postVo;

  const PostContent({super.key, this.postVo});

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  final _stringTagController = StringTagController();

  @override
  Widget build(BuildContext context) {
    if (widget.postVo == null) {
      return const Placeholder();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 帖子标题
        Text(
          widget.postVo!.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),

        10.verticalSpace,

        // 图片轮播图
        CustomBanner(
          bannerList: widget.postVo!.imageList,
          boxFit: BoxFit.cover,
          initialIndex: widget.postVo!.coverIndex - 1,
        ),

        10.verticalSpace,

        // 帖子内容
        ExpandableMarkdown(
          data: widget.postVo!.content,
          styleSheet: MarkdownStyleSheet(
            p: TextStyle(
              fontSize: 15.sp,
              height: 1.6,
              fontFamily: 'PingFang SC',
            ),
          ),
        ),

        TagWrapShow(tagList: widget.postVo!.tagList)
      ],
    );
  }
}
