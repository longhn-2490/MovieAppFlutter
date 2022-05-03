import 'package:equatable/equatable.dart';
import 'package:movieapp/data/model/movie_data.dart';

import '../../../data/model/cast_data.dart';

abstract class MovieDetailState implements Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class Idle extends MovieDetailState {
  @override
  bool? get stringify => true;
}

class MovieLoading extends MovieDetailState {
  @override
  bool? get stringify => true;
}

class MovieDetailLoaded extends MovieDetailState {
  final MovieData movie;

  MovieDetailLoaded({required this.movie});

  @override
  List<Object> get props => [movie];

  @override
  bool? get stringify => true;
}

class LoadFailed extends MovieDetailState {
  final String message;

  LoadFailed({required this.message});

  @override
  bool? get stringify => true;
}

class CastsLoaded extends MovieDetailState {
  final List<CastData> casts;

  CastsLoaded({required this.casts});

  @override
  List<Object> get props => [casts];

  @override
  bool? get stringify => true;
}

class CastLoadFailed extends MovieDetailState {
  final String message;

  CastLoadFailed({required this.message});

  @override
  bool? get stringify => true;
}

class SimilarMovieLoaded extends MovieDetailState {
  final List<MovieData> movies;

  SimilarMovieLoaded({required this.movies});

  @override
  List<Object> get props => [movies];

  @override
  bool? get stringify => true;
}

class SimilarMovieLoadFailed extends MovieDetailState {
  final String message;

  SimilarMovieLoadFailed({required this.message});

  @override
  bool? get stringify => true;
}
