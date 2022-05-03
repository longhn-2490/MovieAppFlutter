import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/domain/usecases/find_movies_usecase.dart';
import 'package:movieapp/domain/usecases/get_casts_usecase.dart';
import 'package:movieapp/domain/usecases/get_similar_movies_usecase.dart';

import 'movie_searching_event.dart';
import 'movie_searching_state.dart';

class MovieSearchingBloc
    extends Bloc<MovieSearchingEvent, MovieSearchingState> {
  final FindMoviesUseCase findMoviesUseCase;

  MovieSearchingBloc(this.findMoviesUseCase) : super(MovieSearchingLoading()) {
    on<SearchMoviesEvent>(_onStarted);
  }

  void _onStarted(
      SearchMoviesEvent event, Emitter<MovieSearchingState> emit) async {
    try {
      final movies =
          await findMoviesUseCase.call(FindMoviesParams(query: event.query));
      emit(MovieSearchingLoaded(movies: movies));
    } catch (_) {
      emit(MovieSearchingLoadFailed(message: 'fail'));
    }
  }
}
