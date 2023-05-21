import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleCacheImage extends StatelessWidget {
  final url;
  const CircleCacheImage({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return url == ""
        ? CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: ClipOval(
              child: Image.asset(
                'assets/images/imageplaceholder.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        : CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            errorWidget: (context, url, error) => Image.asset(
              'assets/images/imageplaceholder.png',
              fit: BoxFit.cover,
            ),
            fit: BoxFit.cover,
          );
  }
}
