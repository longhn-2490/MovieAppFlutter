import 'package:moor_flutter/moor_flutter.dart';
import 'package:movieapp/data/model/cast_data.dart';
import 'package:movieapp/data/model/movie_data.dart';

import '../../data/local/app_database.dart';
import '../../data/model/loadmore_data.dart';

abstract class MovieRepository {
  Future<LoadMoreData<MovieData>> getMovies(String type, int page);

  Future<List<MovieData>> findMovies(String searchKey);

  Future<MovieData> getMovieDetail(int id);

  Future<List<CastData>> getCasts(int id);

  Future<LoadMoreData<MovieData>> getMoviesByGenre(String genre, int page);

  Future<List<MovieData>> getSimilarMovies(int id);

  Future<List<MovieData>> findAllMovies();

  Future<int> insertMovie(MovieData movie);

  Future<int> deleteMovie(int id);
}
