import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleCacheImage extends StatelessWidget {
  final userImage;
  const CircleCacheImage({super.key, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: CachedNetworkImage(
        imageUrl: userImage.toString(),
        placeholder: (context, url) => Container(),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.fill,
      ),
    );
  }
}
