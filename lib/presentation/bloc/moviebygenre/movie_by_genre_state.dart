import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/data/model/movie_data.dart';

import '../../../data/model/loadmore_data.dart';

abstract class MovieByGenreState implements Equatable {
  const MovieByGenreState();

  @override
  List<Object> get props => [];
}

class Idle extends MovieByGenreState {
  @override
  bool? get stringify => true;
}

class MovieByGenreLoading extends MovieByGenreState {
  @override
  bool? get stringify => true;
}

class MovieByGenreLoaded extends MovieByGenreState {
  final LoadMoreData<MovieData> loadMoreData;


  MovieByGenreLoaded({required this.loadMoreData});

  @override
  List<Object> get props => [loadMoreData];

  @override
  bool? get stringify => true;
}

class MovieByGenreLoadFailed extends MovieByGenreState {
  final String message;
  MovieByGenreLoadFailed({required this.message});
  @override
  bool? get stringify => true;
}
