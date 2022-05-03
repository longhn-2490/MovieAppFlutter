import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/core/utils/color.dart';

import '../../data/model/movie_data.dart';

class MovieThumbnail extends StatelessWidget {
  MovieData movie;

  MovieThumbnail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: portGore,
      margin: const EdgeInsets.all(7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: movie.getImagePath(),
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              movie.title.toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'charter',
                  fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          _buildRatingBar(movie.voteAverage ?? 0),
          const SizedBox(
            height: 8,
          ),
          _buildMovieTime()
        ],
      ),
    );
  }

  Widget _buildRatingBar(double ratingCount) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBar.builder(
              direction: Axis.horizontal,
              initialRating: ratingCount/2,
              itemCount: 5,
              allowHalfRating: true,
              itemSize: 11,
              wrapAlignment: WrapAlignment.start,
              ignoreGestures: true,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.yellow
                  ),
              onRatingUpdate: (_) {}),
          Text(
              (ratingCount/2).toString(),
            style: const TextStyle(
                fontSize: 12.5,
                fontFamily: 'charter',
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
          const SizedBox()
        ],
      ),
    );
  }

  Widget _buildMovieTime() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        children: const [
          Icon(
            Icons.access_time,
            color: Colors.yellow,
            size: 11,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            '2h 02m',
            style: TextStyle(
                fontSize: 12.5,
                fontFamily: 'charter',
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
        ],
      ),
    );
  }
}
