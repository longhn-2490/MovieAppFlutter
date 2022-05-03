import 'package:movieapp/data/local/moor/database_impl.dart';
import 'package:movieapp/data/model/cast_data.dart';
import 'package:movieapp/data/model/loadmore_data.dart';
import 'package:movieapp/data/model/movie_data.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';

import '../core/utils/constants.dart';
import 'remote/api/dio/movie_api.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApi _movieApi;
  final DataBaseImpl dataBaseImpl;

  const MovieRepositoryImpl(this._movieApi, this.dataBaseImpl);

  @override
  Future<LoadMoreData<MovieData>> getMoviesByGenre(
      String genre, int page) async {
    return await _movieApi.getMoviesByType(genre, page).then((response) =>
        LoadMoreData(
            data: response.movies ?? [],
            page: response.page,
            totalPages: response.totalPages));
  }

  @override
  Future<LoadMoreData<MovieData>> getMovies(String type, int page) async {
    return await _movieApi.getMovies(type, page, apiKey).then((response) =>
        LoadMoreData(
            data: response.movies ?? [],
            page: response.page,
            totalPages: response.totalPages));
  }

  @override
  Future<List<MovieData>> findMovies(String searchKey) async {
    final response = await _movieApi.findMovies(searchKey);
    return response.movies ?? [];
  }

  @override
  Future<List<CastData>> getCasts(int id) async {
    final credit = await _movieApi.getCasts(id);
    return credit.casts ?? [];
  }

  @override
  Future<MovieData> getMovieDetail(int id) async {
    return await _movieApi.getMovieDetail(apiKey, id);
  }

  @override
  Future<List<MovieData>> getSimilarMovies(int id) async {
    final response = await _movieApi.getSimilarMovies(id);
    return response.movies ?? [];
  }

  @override
  Future<int> deleteMovie(int id) {
    return dataBaseImpl.deleteMovie(id);
  }

  @override
  Future<List<MovieData>> findAllMovies() {
    return dataBaseImpl.findAllMovies();
  }

  @override
  Future<int> insertMovie(MovieData movie) {
    return dataBaseImpl.insertMovie(movie);
  }
}
