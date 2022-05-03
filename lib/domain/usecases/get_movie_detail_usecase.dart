import 'package:equatable/equatable.dart';
import 'package:movieapp/data/model/movie_data.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

class GetMovieDetailUseCase extends UseCase<MovieData, MovieDetailParams> {
  final MovieRepository _repository;

  GetMovieDetailUseCase(this._repository);

  @override
  Future<MovieData> call(MovieDetailParams params) async {
    return _repository.getMovieDetail(params.id);
  }
}

class MovieDetailParams extends Equatable {
  int id;

  MovieDetailParams({required this.id});

  @override
  List<Object> get props => [id];
}
