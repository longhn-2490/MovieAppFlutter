import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/data/model/movie_data.dart';

abstract class FavoriteMovieState implements Equatable {
  const FavoriteMovieState();

  @override
  List<Object> get props => [];
}

class Idle extends FavoriteMovieState {
  @override
  bool? get stringify => true;
}

class FavoriteMoviesLoading extends FavoriteMovieState {
  @override
  bool? get stringify => true;
}

class FavoriteMoviesLoaded extends FavoriteMovieState {
  final List<MovieData> movies;

  FavoriteMoviesLoaded({required this.movies});

  @override
  List<Object> get props => [movies];

  @override
  bool? get stringify => true;
}

class FavoriteMovieDeletionRequest extends FavoriteMovieState {
  final int id;

  FavoriteMovieDeletionRequest({required this.id});

  @override
  bool? get stringify => true;
}

class FavoriteMovieDeleted extends FavoriteMovieState {
  FavoriteMovieDeleted();

  @override
  bool? get stringify => true;
}

class FavoriteMovieInsertionRequest extends FavoriteMovieState {
  final MovieData movie;

  FavoriteMovieInsertionRequest({required this.movie});

  @override
  bool? get stringify => true;
}

class FavoriteMovieInserted extends FavoriteMovieState {
  FavoriteMovieInserted();

  @override
  bool? get stringify => true;
}
