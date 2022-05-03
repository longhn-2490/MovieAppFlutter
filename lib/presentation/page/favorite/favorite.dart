import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/data/model/movie_data.dart';
import 'package:movieapp/presentation/bloc/favoritemovie/bloc.dart';
import 'package:movieapp/presentation/widgets/favorite_movie_thumbnail.dart';
import 'package:movieapp/presentation/widgets/utils.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favorite',
          style: TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: BlocBuilder<FavoriteMovieBloc, FavoriteMovieState>(
        builder: (context, state) {
          if (state is FavoriteMoviesLoading) {
            showLoader();
          }
          if (state is FavoriteMoviesLoaded) {
            print('state  ${state.movies}');

            return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return buildFavoriteItem(context, state.movies[index]);
                },
                itemCount: state.movies.length);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget buildFavoriteItem(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/MovieDetailsView', arguments: movie.id);
      },
      child: Slidable(
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                key: const Key("a"),
                onPressed: (value) {
                  deleteFavorite(context, movie.id ?? -1);
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.black,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                key: const Key("b"),
                onPressed: (value) {
                  deleteFavorite(context, movie.id ?? -1);
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.black,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: FavoriteMovieThumbnail(movie: movie)),
    );
  }

  void deleteFavorite(BuildContext context, int id) {
    context.read<FavoriteMovieBloc>().add(DeleteFavoriteMovieEvent(id));
  }
}
