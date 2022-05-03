import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/data/model/movie_data.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

class FindAllFavoriteMoviesUseCase extends UseCase<List<MovieData>, NoParams> {
  final MovieRepository _repository;

  FindAllFavoriteMoviesUseCase(this._repository);

  @override
  Future<List<MovieData>> call(NoParams params) async {
    return _repository.findAllMovies();
  }
}
