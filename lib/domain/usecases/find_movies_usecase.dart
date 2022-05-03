import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/data/model/movie_data.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

class FindMoviesUseCase extends UseCase<List<MovieData>, FindMoviesParams> {
  final MovieRepository _repository;

  FindMoviesUseCase(this._repository);

  @override
  Future<List<MovieData>> call(FindMoviesParams params) async {
    return _repository.findMovies(params.query);
  }
}

@immutable
class FindMoviesParams extends Equatable {
  String query;

  FindMoviesParams({required this.query});

  @override
  List<Object> get props => [query];
}
