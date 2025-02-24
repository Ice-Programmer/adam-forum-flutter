import 'package:adam_forum_app/components/full_screen_gallery.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  final double borderRadius;
  final bool canView;
  final double maxHeight;
  final double maxWidth;

  const CacheImage({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.borderRadius = 0,
    this.canView = false,
    this.maxHeight = double.infinity,
    this.maxWidth = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: canView
          ? () {
              _openFullScreen(context);
            }
          : () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: ConstrainedBox(

          constraints: BoxConstraints(
            maxHeight: maxHeight,
            maxWidth: maxWidth
          ),
          child: CachedNetworkImage(
            height: height,
            width: width,
            fit: BoxFit.cover,
            placeholder: (
              BuildContext context,
              String url,
            ) =>
                Container(color: Colors.grey[200]),
            errorWidget: (
              BuildContext context,
              String url,
              dynamic error,
            ) =>
                const Icon(Icons.error),
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }

  void _openFullScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, animation, secondaryAnimation) => FullScreenGallery(
          images: [imageUrl],
          initialIndex: 0,
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
