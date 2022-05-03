import 'package:equatable/equatable.dart';
import 'package:movieapp/data/model/loadmore_data.dart';
import 'package:movieapp/data/model/movie_data.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

class GetMoviesUseCase extends UseCase<LoadMoreData<MovieData>, Params> {
  final MovieRepository _repository;

  GetMoviesUseCase(this._repository);

  @override
  Future<LoadMoreData<MovieData>> call(Params params) async {
    return _repository.getMovies(params.type, params.page);
  }
}

class Params extends Equatable {
  String type;
  int page;

  Params({required this.type, required this.page});

  @override
  List<Object> get props => [type];
}
