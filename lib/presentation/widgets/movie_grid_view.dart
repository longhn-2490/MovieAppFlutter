import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp/core/utils/color.dart';
import 'package:movieapp/presentation/widgets/movie_thumbnail.dart';

import '../../data/model/movie_data.dart';

class MovieGridView extends StatefulWidget {
  List<MovieData> movies;
  PagingController<int, MovieData> pagingController;
  MovieGridView({Key? key, required this.movies, required this.pagingController}) : super(key: key);

  @override
  State<MovieGridView> createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const itemHeight = 260;
    final itemWidth = size.width / 3;
    return Container(
      color: darkBlue,
      child: PagedGridView(
          builderDelegate: PagedChildBuilderDelegate<MovieData>(
            itemBuilder: (context, item, index) => _buildMovieItem(context, item)
          ),
          pagingController: widget.pagingController,
          padding: const EdgeInsets.only(
            left: 7,
            right: 7,
            top: 7,
          ),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: itemWidth / itemHeight),
        ),
    );
  }

  Widget _buildMovieItem(BuildContext context, MovieData movie) {
    print('here $movie');

    return InkWell(
      onTap: () => _onMoviePressed(context, movie.id ?? -1),
      child: MovieThumbnail(movie: movie),
    );
  }

  void _onMoviePressed(BuildContext context, int id) {
    Navigator.pushNamed(context, '/MovieDetailsView', arguments: id);
  }
}
