import 'package:equatable/equatable.dart';
import 'package:movieapp/data/model/movie_data.dart';

abstract class MovieSearchingState implements Equatable {
  const MovieSearchingState();

  @override
  List<Object> get props => [];
}

class Idle extends MovieSearchingState {
  @override
  bool? get stringify => true;
}

class MovieSearchingLoading extends MovieSearchingState {
  @override
  bool? get stringify => true;
}

class MovieSearchingLoaded extends MovieSearchingState {
  final List<MovieData> movies;

  MovieSearchingLoaded({required this.movies});

  @override
  List<Object> get props => [movies];

  @override
  bool? get stringify => true;
}

class MovieSearchingLoadFailed extends MovieSearchingState {
  final String message;

  MovieSearchingLoadFailed({required this.message});

  @override
  bool? get stringify => true;
}
