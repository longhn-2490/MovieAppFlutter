// import 'package:equatable/equatable.dart';
// import 'package:movieapp/data/model/movie_data.dart';
//
// abstract class SimilarMovieState implements Equatable {
//   const SimilarMovieState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class Idle extends SimilarMovieState {
//   @override
//   bool? get stringify => true;
// }
//
// class SimilarMovieLoading extends SimilarMovieState {
//   @override
//   bool? get stringify => true;
// }
//
// class SimilarMovieLoaded extends SimilarMovieState {
//   final List<MovieData> movies;
//
//   SimilarMovieLoaded({required this.movies});
//
//   @override
//   List<Object> get props => [movies];
//
//   @override
//   bool? get stringify => true;
// }
//
// class SimilarMovieLoadFailed extends SimilarMovieState {
//   final String message;
//
//   SimilarMovieLoadFailed({required this.message});
//
//   @override
//   bool? get stringify => true;
// }
