import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class ImageNetworkCatch extends StatelessWidget {
  const ImageNetworkCatch({
    super.key,
    required this.imageUrl,
    required this.hash,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });
  final String imageUrl;
  final String hash;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: key,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) {
        return SizedBox(
          width: width,
          height: height,
          child: BlurHash(hash: hash),
        );
      },
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
