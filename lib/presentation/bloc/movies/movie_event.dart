import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/data/model/movie_data.dart';

@immutable
abstract class MovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadUpcomingMoviesEvent extends MovieEvent {
  final int page;

  LoadUpcomingMoviesEvent({required this.page});
}

class LoadTopRatedMoviesEvent extends MovieEvent {
  final int page;

  LoadTopRatedMoviesEvent({required this.page});
}

class LoadNowPlayingMoviesEvent extends MovieEvent {
  final int page;

  LoadNowPlayingMoviesEvent({required this.page});
}

class LoadPopularMoviesEvent extends MovieEvent {
  final int page;

  LoadPopularMoviesEvent({required this.page});
}

