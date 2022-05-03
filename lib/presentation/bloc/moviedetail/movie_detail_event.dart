import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/data/model/movie_data.dart';

@immutable
abstract class MovieDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadMovieDetailEvent extends MovieDetailEvent{
  final int id;

  LoadMovieDetailEvent(this.id);
}
class LoadCastsEvent extends MovieDetailEvent{
  final int id;

  LoadCastsEvent(this.id);
}

class LoadSimilarMoviesEvent extends MovieDetailEvent{
  final int id;

  LoadSimilarMoviesEvent(this.id);
}
