import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/data/model/movie_data.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

class InsertMovieUseCase extends UseCase<int, MovieInsertingParams> {
  final MovieRepository _repository;

  InsertMovieUseCase(this._repository);

  @override
  Future<int> call(MovieInsertingParams params) async {
    return _repository.insertMovie(params.movie);
  }
}

class MovieInsertingParams {
  MovieData movie;

  MovieInsertingParams({required this.movie});
}
