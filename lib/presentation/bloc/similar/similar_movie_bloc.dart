// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movieapp/domain/usecases/get_casts_usecase.dart';
// import 'package:movieapp/domain/usecases/get_similar_movies_usecase.dart';
//
// import 'similar_movie_event.dart';
// import 'similar_movie_state.dart';
//
// class SimilarMovieBloc extends Bloc<SimilarMovieEvent, SimilarMovieState> {
//   final GetSimilarMoviesUseCase getSimilarMoviesUseCase;
//
//   SimilarMovieBloc(this.getSimilarMoviesUseCase) : super(SimilarMovieLoading()) {
//     on<LoadSimilarMoviesEvent>(_onStarted);
//   }
//
//   void _onStarted(
//       LoadSimilarMoviesEvent event, Emitter<SimilarMovieState> emit) async {
//     try {
//       final movies =
//           await getSimilarMoviesUseCase.call(SimilarMovieParams(id: event.id));
//       emit(SimilarMovieLoaded(movies: movies));
//     } catch (_) {
//       emit(SimilarMovieLoadFailed(message: 'fail'));
//     }
//   }
// }
