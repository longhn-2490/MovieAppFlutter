import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/data/model/loadmore_data.dart';
import 'package:movieapp/data/model/movie_data.dart';

abstract class MovieState implements Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class Idle extends MovieState {
  @override
  bool? get stringify => true;
}

class Loading extends MovieState {
  @override
  bool? get stringify => true;
}

class Loaded extends MovieState {
  final LoadMoreData<MovieData> loadMoreData;

  Loaded({required this.loadMoreData});

  @override
  List<Object> get props => [loadMoreData];

  @override
  bool? get stringify => true;
}

class LoadFailed extends MovieState {
  final String message;

  LoadFailed({required this.message});

  @override
  bool? get stringify => true;
}
