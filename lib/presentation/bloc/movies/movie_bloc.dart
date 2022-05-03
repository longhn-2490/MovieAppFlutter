import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/utils/constants.dart';
import 'package:movieapp/data/model/loadmore_data.dart';
import 'package:movieapp/domain/usecases/get_movies_usecase.dart';
import '../../../data/model/movie_data.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMoviesUseCase getMoviesUseCase;

  MovieBloc(this.getMoviesUseCase) : super(Loading()) {
    on<LoadUpcomingMoviesEvent>((event, emit) async {
      LoadMoreData<MovieData> data =
          await getMoviesUseCase.call(Params(type: upcoming, page: event.page));
      emit(Loaded(loadMoreData: data));
    });
    on<LoadTopRatedMoviesEvent>((event, emit) async {
      LoadMoreData<MovieData> data =
          await getMoviesUseCase.call(Params(type: topRated, page: event.page));
      emit(Loaded(loadMoreData: data));
    });
    on<LoadPopularMoviesEvent>((event, emit) async {
      LoadMoreData<MovieData> data =
          await getMoviesUseCase.call(Params(type: popular, page: event.page));
      emit(Loaded(loadMoreData: data));
    });
    on<LoadNowPlayingMoviesEvent>((event, emit) async {
      LoadMoreData<MovieData> data = await getMoviesUseCase
          .call(Params(type: nowPlaying, page: event.page));
      emit(Loaded(loadMoreData: data));
    });
  }
}
