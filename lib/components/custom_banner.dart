import 'package:adam_forum_app/components/full_screen_gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class CustomBanner extends StatelessWidget {
  final List<String> bannerList;
  final BoxFit boxFit;
  final int initialIndex;

  const CustomBanner({
    super.key,
    required this.bannerList,
    required this.boxFit,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height * 0.45;
    return SizedBox(
      height: maxHeight,
      child: Swiper(
        itemCount: bannerList.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildImage(bannerList[index], index, context);
        },
        loop: false,
        index: initialIndex,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            color: Colors.white60,
            activeColor: Theme.of(context).colorScheme.primary,
            size: 6,
            activeSize: 6,
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String image, int index,  BuildContext context) {
    return InkWell(
      onTap: () => _openFullScreen(context, index),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          child: Hero(
            tag: 'banner_hero_$index', // 唯一标识（需包含index）
            child: CachedNetworkImage(
              imageUrl: image,
              fit: boxFit,
            ),
          ),
        ),
      ),
    );
  }

  void _openFullScreen(BuildContext context, int initialIndex) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, animation, secondaryAnimation) => FullScreenGallery(
          images: bannerList,
          initialIndex: initialIndex,
        ),
        transitionsBuilder: (_, animation, __, child) {
          return ScaleTransition(
            // 缩放动画
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: FadeTransition(
              // 叠加淡入效果
              opacity: animation,
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 100),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }
}
