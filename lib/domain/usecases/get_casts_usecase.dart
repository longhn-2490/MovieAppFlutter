import 'package:equatable/equatable.dart';
import 'package:movieapp/data/model/cast_data.dart';
import 'package:movieapp/data/model/movie_data.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

class GetCastsUseCase extends UseCase<List<CastData>, CastParams> {
  final MovieRepository _repository;

  GetCastsUseCase(this._repository);

  @override
  Future<List<CastData>> call(CastParams params) async {
    return _repository.getCasts(params.id);
  }
}

class CastParams extends Equatable {
  int id;

  CastParams({required this.id});

  @override
  List<Object> get props => [id];
}
