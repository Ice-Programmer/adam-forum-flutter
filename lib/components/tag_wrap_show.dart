import 'package:adam_forum_app/model/forum_post/tag/tag_vo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagWrapShow extends StatelessWidget {
  final List<TagVo> tagList;

  const TagWrapShow({
    super.key,
    required this.tagList,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.w,
      children: tagList.map((tag) {
        return Text(
          '#${tag.name} ',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        );
      }).toList(),
    );
  }
}
