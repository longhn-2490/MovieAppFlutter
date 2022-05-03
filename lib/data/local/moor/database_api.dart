import 'package:moor_flutter/moor_flutter.dart';

import '../../model/movie_data.dart';

abstract class DataBaseApi {
  Future<List<MovieData>> findAllMovies();

  Future<int> insertMovie(MovieData movie);

  Future deleteMovie(int id);
}
