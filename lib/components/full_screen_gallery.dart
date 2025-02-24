import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// 新增全屏画廊组件
class FullScreenGallery extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenGallery({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              pageController: PageController(initialPage: initialIndex),
              itemCount: images.length,
              builder: (context, index) => PhotoViewGalleryPageOptions(
                imageProvider: CachedNetworkImageProvider(images[index]),
                heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 4,
                basePosition: Alignment.center, // 关键对齐设置
              ),
              backgroundDecoration: const BoxDecoration(color: Colors.black),
            ),
            Positioned(
              top: 12 + MediaQuery.of(context).padding.top,
              left: 12,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 28.sp,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
