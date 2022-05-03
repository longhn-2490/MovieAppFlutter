import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/data/model/movie_data.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

class DeleteMovieUseCase extends UseCase<int, MovieDeletingParams> {
  final MovieRepository _repository;

  DeleteMovieUseCase(this._repository);

  @override
  Future<int> call(MovieDeletingParams params) async {
    return _repository.deleteMovie(params.id);
  }
}

class MovieDeletingParams {
  int id;
  MovieDeletingParams({required this.id});
}
