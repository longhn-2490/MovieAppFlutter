import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/domain/usecases/get_movie_detail_usecase.dart';

import '../../../domain/usecases/get_casts_usecase.dart';
import '../../../domain/usecases/get_similar_movies_usecase.dart';
import 'movie_detail_event.dart';
import 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  final GetCastsUseCase getCastsUseCase;

  MovieDetailBloc(this.getMovieDetailUseCase, this.getSimilarMoviesUseCase,
      this.getCastsUseCase)
      : super(MovieLoading()) {
    on<LoadMovieDetailEvent>(_loadDetail);
    on<LoadCastsEvent>(_loadCast);
    on<LoadSimilarMoviesEvent>(_loadSimilarMovies);
  }

  void _loadDetail(
      LoadMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    try {
      final movie =
          await getMovieDetailUseCase(MovieDetailParams(id: event.id));
      emit(MovieDetailLoaded(movie: movie));
    } catch (_) {}
  }

  void _loadCast(LoadCastsEvent event, Emitter<MovieDetailState> emit) async {
    try {
      final casts = await getCastsUseCase.call(CastParams(id: event.id));
      emit(CastsLoaded(casts: casts));
    } catch (_) {
      emit(CastLoadFailed(message: 'fail'));
    }
  }

  void _loadSimilarMovies(
      LoadSimilarMoviesEvent event, Emitter<MovieDetailState> emit) async {
    try {
      final movies =
          await getSimilarMoviesUseCase.call(SimilarMovieParams(id: event.id));
      emit(SimilarMovieLoaded(movies: movies));
    } catch (_) {
      emit(SimilarMovieLoadFailed(message: 'fail'));
    }
  }
}
