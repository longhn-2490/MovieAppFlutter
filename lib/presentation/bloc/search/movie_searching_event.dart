import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MovieSearchingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchMoviesEvent extends MovieSearchingEvent{
  final String query;

  SearchMoviesEvent(this.query);
}

