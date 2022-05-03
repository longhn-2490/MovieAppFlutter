import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/data/model/movie_data.dart';

@immutable
abstract class FavoriteMovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FindAllFavoriteMoviesEvent extends FavoriteMovieEvent {}

class DeleteFavoriteMovieEvent extends FavoriteMovieEvent {
  final int id;

  DeleteFavoriteMovieEvent(this.id);
}

class InsertFavoriteMovieEvent extends FavoriteMovieEvent {
  final MovieData movie;

  InsertFavoriteMovieEvent(this.movie);
}
