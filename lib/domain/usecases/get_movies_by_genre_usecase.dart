import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/data/model/movie_data.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

import '../../data/model/loadmore_data.dart';

class GetMoviesByGenreUseCase extends UseCase<LoadMoreData<MovieData>, MovieByGenreParams> {
  final MovieRepository _repository;

  GetMoviesByGenreUseCase(this._repository);

  @override
  Future<LoadMoreData<MovieData>> call(MovieByGenreParams params) async {
    return _repository.getMoviesByGenre(params.type, params.page);
  }
}

class MovieByGenreParams extends Equatable {
  String type;
  int page;
  MovieByGenreParams({required this.type, required this.page});

  @override
  List<Object> get props => [type];
}
