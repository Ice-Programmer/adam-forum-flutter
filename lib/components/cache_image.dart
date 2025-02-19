import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;
  final double borderRadius;

  const CacheImage({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
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
    );
  }
}
