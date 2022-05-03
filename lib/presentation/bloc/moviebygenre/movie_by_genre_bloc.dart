import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/domain/usecases/get_movies_by_genre_usecase.dart';

import '../../../data/model/loadmore_data.dart';
import '../../../data/model/movie_data.dart';
import 'movie_by_genre_event.dart';
import 'movie_by_genre_state.dart';

class MovieByGenreBloc extends Bloc<MovieByGenreEvent, MovieByGenreState> {
  final GetMoviesByGenreUseCase getMoviesByGenreUseCase;

  MovieByGenreBloc(this.getMoviesByGenreUseCase)
      : super(MovieByGenreLoading()) {
    on<LoadMoviesByGenreEvent>(_onStarted);
  }

  void _onStarted(
      LoadMoviesByGenreEvent event, Emitter<MovieByGenreState> emit) async {
    try {
      LoadMoreData<MovieData> loadMoreData = await getMoviesByGenreUseCase
          .call(MovieByGenreParams(type: event.type, page: event.page));
      emit(MovieByGenreLoaded(loadMoreData: loadMoreData));
    } catch (_) {
      emit(MovieByGenreLoadFailed(message: 'fail'));
    }
  }
}
