import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MovieByGenreEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadMoviesByGenreEvent extends MovieByGenreEvent{
  final String type;
  final int page;
  LoadMoviesByGenreEvent(this.type, this.page);
}
