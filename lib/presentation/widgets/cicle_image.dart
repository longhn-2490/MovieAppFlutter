import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  // 1
  const CircleImage({
    Key? key,
    required this.imageProvider,
    this.imageRadius = 20,
  }) : super(key: key);

// 2
  final double imageRadius;
  final String imageProvider;

  @override
  Widget build(BuildContext context) {
// 3
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      // 4
      child: CircleAvatar(
        radius: imageRadius - 3,
        child: Container(
            decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: CachedNetworkImageProvider(imageProvider),
              fit: BoxFit.cover),
        )),
      ),
    );
  }
}
