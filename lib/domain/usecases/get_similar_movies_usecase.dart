import 'package:equatable/equatable.dart';
import 'package:movieapp/data/model/cast_data.dart';
import 'package:movieapp/data/model/movie_data.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

class GetSimilarMoviesUseCase extends UseCase<List<MovieData>, SimilarMovieParams> {
  final MovieRepository _repository;

  GetSimilarMoviesUseCase(this._repository);

  @override
  Future<List<MovieData>> call(SimilarMovieParams params) async {
    return _repository.getSimilarMovies(params.id);
  }
}

class SimilarMovieParams extends Equatable {
  int id;

  SimilarMovieParams({required this.id});

  @override
  List<Object> get props => [id];
}
