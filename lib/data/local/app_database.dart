import 'package:moor_flutter/moor_flutter.dart';
import 'package:movieapp/data/local/moor/dao/movie_dao.dart';
import 'package:movieapp/data/local/moor/table/movie_table.dart';

part 'app_database.g.dart';

@UseMoor(tables: [MovieTable], daos: [MovieDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'movie.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
