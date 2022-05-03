import 'package:movieapp/data/local/app_database.dart';
import 'package:movieapp/data/local/moor/database_api.dart';

import '../../model/movie_data.dart';

class DataBaseImpl implements DataBaseApi {
  AppDatabase database;

  DataBaseImpl(this.database);

  @override
  Future<int> deleteMovie(int id) {
    return database.movieDao.deleteMovie(id);
  }

  @override
  Future<List<MovieData>> findAllMovies() async {
    return database.movieDao.findAllMovies().then((moviesTable) {
      return moviesTable
          .map((movie) => database.movieDao.movieTableToMovie(movie))
          .toList();
    });
  }

  @override
  Future<int> insertMovie(MovieData movie) {
    return database.movieDao
        .insertMovie(database.movieDao.movieToMovieTable(movie));
  }
}
