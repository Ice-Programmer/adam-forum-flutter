import 'package:adam_forum_app/pages/forum/components/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          ],
        ),
      ),
    );
  }
}
