import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/core/utils/color.dart';

import '../../data/model/movie_data.dart';

class ThicknessMovieThumbnail extends StatelessWidget {
  MovieData movie;

  ThicknessMovieThumbnail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: movie.getImagePath(),
          width: double.infinity,
          height: 248,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            color: Colors.black.withOpacity(0.71),
            child: Text(
              movie.title.toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'charter',
                  fontSize: 16),
            ),
          ),
        ),

      ],
    );
  }
}
