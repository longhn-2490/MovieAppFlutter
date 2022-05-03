import 'package:moor_flutter/moor_flutter.dart';
import 'package:movieapp/data/local/app_database.dart';
import 'package:movieapp/data/local/moor/table/movie_table.dart';
import 'package:movieapp/data/model/genre_data.dart';
import 'package:movieapp/data/model/movie_data.dart';

part 'movie_dao.g.dart';

@UseDao(tables: [MovieTable])
class MovieDao extends DatabaseAccessor<AppDatabase> with _$MovieDaoMixin {
  final AppDatabase db;

  MovieDao(this.db) : super(db);

  Future<List<MovieTableData>> findAllMovies() => select(movieTable).get();

  Future<int> insertMovie(Insertable<MovieTableData> movie) =>
      into(movieTable).insert(movie);

  Future<int> deleteMovie(int id) => Future.value(
      (delete(movieTable)..where((tbl) => tbl.id.equals(id))).go());

  MovieData movieTableToMovie(MovieTableData movie) {
    return MovieData(
      id: movie.id,
      title: movie.name,
      posterPath: movie.image,
      genres: [GenreData(name: movie.genre)],
      voteAverage: movie.rating,
    );
  }

  Insertable<MovieTableData> movieToMovieTable(MovieData movie) {
    return MovieTableCompanion.insert(
        id: movie.id ?? 0,
        name: movie.title ?? '',
        genre: movie.genres?.first.name ?? '',
        image: movie.posterPath ?? '',
        vote: movie.voteCount ?? 0,
        rating: movie.voteAverage ?? 0);
  }
}
