import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieRatingBar extends StatelessWidget {
  final double ratingCount;
  MovieRatingBar({Key? key, required this.ratingCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        RatingBar.builder(
            direction: Axis.horizontal,
            initialRating: ratingCount/2,
            itemCount: 5,
            allowHalfRating: true,
            itemSize: 19,
            wrapAlignment: WrapAlignment.start,
            ignoreGestures: true,
            itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
            itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.yellow
            ),
            onRatingUpdate: (_) {}),
        const SizedBox(width: 20,),
        Text(
          (ratingCount/2).toString(),
          style: const TextStyle(
              fontSize: 19,
              fontFamily: 'charter',
              fontWeight: FontWeight.bold,
              color: Colors.yellow),
        ),
        const SizedBox()
      ],
    );
  }
}
