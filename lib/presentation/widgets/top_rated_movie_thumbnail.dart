import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/core/utils/color.dart';

import '../../data/model/movie_data.dart';

class TopRatedMovieThumbnail extends StatelessWidget {
  MovieData movie;

  TopRatedMovieThumbnail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top:25),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 65,
              ),
              Container(height: 166, width: double.infinity, color: cloudBurst2),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: movie.getImagePath(),
                    width: 119,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 78, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'charter',
                                fontSize:18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          _buildRatingBar(movie.voteAverage ?? 0),
                          const SizedBox(
                            height: 10,
                          ),
                          _buildMovieTime(),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Director: Long',
                            style: TextStyle(
                                fontSize: 17,
                                color: greyBlue,
                                fontFamily: 'Charter',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildRatingBar(double ratingCount) {
    return Wrap(
      children: [
        RatingBar.builder(
            direction: Axis.horizontal,
            initialRating: ratingCount / 2,
            itemCount: 5,
            allowHalfRating: true,
            itemSize: 16,
            wrapAlignment: WrapAlignment.start,
            ignoreGestures: true,
            itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
            itemBuilder: (context, _) =>
            const Icon(Icons.star, color: Colors.yellow),
            onRatingUpdate: (_) {}),
        Text(
          (ratingCount / 2).toString(),
          style: const TextStyle(
              fontSize: 16,
              fontFamily: 'charter',
              fontWeight: FontWeight.bold,
              color: Colors.yellow),
        ),
        const SizedBox()
      ],
    );
  }

  Widget _buildMovieTime() {
    return Row(
      children: const [
        Icon(
          Icons.access_time,
          color: Colors.yellow,
          size: 15,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          '2h 02m',
          style: TextStyle(
              fontSize: 16,
              fontFamily: 'charter',
              fontWeight: FontWeight.bold,
              color: Colors.yellow),
        ),
      ],
    );
  }

}
