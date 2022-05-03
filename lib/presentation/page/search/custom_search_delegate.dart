import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/utils/color.dart';
import 'package:movieapp/presentation/bloc/search/bloc.dart';
import 'package:movieapp/presentation/model/discover_model.dart';
import 'package:movieapp/presentation/widgets/thickness_movie_thumbnail.dart';

import '../../../data/model/movie_data.dart';
import '../../../injector.dart';
import '../../widgets/utils.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocProvider<MovieSearchingBloc>(
        create: (_) =>
        injector()
          ..add(SearchMoviesEvent(query)),
        child: BlocBuilder<MovieSearchingBloc, MovieSearchingState>(
          builder: (context, state) {
            if (state is MovieSearchingLoading) {
              return showLoader();
            }
            if (state is MovieSearchingLoaded) {
              return _buildGridView(context, state.movies);
            }
            if (state is Error) {
              return showRefresh();
            }
            return const SizedBox();
          },
        ));
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: darkBlue,
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        // Use this change the placeholder's text style
        hintStyle: TextStyle(fontSize: 18.0),
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(
          decorationColor: Colors.transparent, // color of text underline
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider<MovieSearchingBloc>(
        create: (_) =>
        injector()
          ..add(SearchMoviesEvent(query)),
        child: BlocBuilder<MovieSearchingBloc, MovieSearchingState>(
          builder: (context, state) {
            if (state is MovieSearchingLoading) {
              return showLoader();
            }
            if (state is MovieSearchingLoaded) {
              return _buildGridView(context, state.movies);
            }
            if (state is Error) {
              return showRefresh();
            }
            return const SizedBox();
          },
        ));
  }

  Widget _buildGridView(BuildContext context, List<MovieData> movies) {
    final size = MediaQuery
        .of(context)
        .size;
    const itemHeight = 250;
    final itemWidth = size.width / 2;
    return GridView.builder(
      shrinkWrap: true,
        itemCount: movies.length,
        padding: const EdgeInsets.only(left: 20, top: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: itemWidth / itemHeight
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/MovieDetailsView', arguments: movies[index].id ?? - 1);
            },
              child: ThicknessMovieThumbnail(movie: movies[index]));
        });
  }
}
