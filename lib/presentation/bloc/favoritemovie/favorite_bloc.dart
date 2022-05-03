import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/data/model/movie_data.dart';
import 'package:movieapp/domain/usecases/delete_movie_usecase.dart';
import 'package:movieapp/domain/usecases/find_all_favorites_movie_usecase.dart';
import 'package:movieapp/domain/usecases/insert_movie_usecase.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteMovieBloc extends Bloc<FavoriteMovieEvent, FavoriteMovieState> {
  final FindAllFavoriteMoviesUseCase favoriteMoviesUseCase;
  final DeleteMovieUseCase deleteMovieUseCase;
  final InsertMovieUseCase insertMovieUseCase;
  List<MovieData> favoriteMovies = [];
  FavoriteMovieBloc(this.favoriteMoviesUseCase, this.deleteMovieUseCase,
      this.insertMovieUseCase)
      : super(FavoriteMoviesLoading()) {
    on<FindAllFavoriteMoviesEvent>(_onStarted);
    on<DeleteFavoriteMovieEvent>(_deleteMovie);
    on<InsertFavoriteMovieEvent>(_insertMovie);
  }

  void _onStarted(FindAllFavoriteMoviesEvent event,
      Emitter<FavoriteMovieState> emit) async {
    try {
      final movies = await favoriteMoviesUseCase.call(NoParams());
      favoriteMovies = movies;
      emit(FavoriteMoviesLoaded(movies: movies));
    } catch (_) {}
  }

  void _insertMovie(
      InsertFavoriteMovieEvent event, Emitter<FavoriteMovieState> emit) async {
    try {
      await insertMovieUseCase.call(MovieInsertingParams(movie: event.movie));
      final movies = await favoriteMoviesUseCase.call(NoParams());
      favoriteMovies = movies;
      emit(FavoriteMoviesLoaded(movies: movies));
    } catch (_) {}
  }

  void _deleteMovie(
      DeleteFavoriteMovieEvent event, Emitter<FavoriteMovieState> emit) async {
    try {
      await deleteMovieUseCase(MovieDeletingParams(id: event.id));
      final movies =  await favoriteMoviesUseCase.call(NoParams());
      favoriteMovies = movies;
      emit(FavoriteMoviesLoaded(movies: movies));
    } catch (_) {}
  }
}
